import 'package:restaurant_tour/domain/exception/app_exception.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:dio/dio.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';
import 'package:restaurant_tour/config/utils/restaurants_query.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

class RestaurantApi extends RestaurantGateway {
  final Dio dio;
  RestaurantApi({required this.dio});

  @override
  Future<RestaurantEntity?> getRestaurant(String id) async {
    try {
      final response = await dio.get('/v3/graphql', queryParameters: {'id': id});
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final queryResult = RestaurantDetailQueryResult.fromJson(data['data']);
        final restaurant = queryResult.restaurant;
        if (restaurant != null) {
          final restaurantEntity = RestaurantMapper.fromInfrastructure(restaurant);
          return restaurantEntity;
        } else {
          throw AppException(FetchAppError.notFound, 'Restaurant not found');
        }
      } else {
        throw _handleErrorResponse(response.statusCode);
      }
    } catch (e) {
      throw AppException(FetchAppError.networkError, 'Error fetching restaurant: $e');
    }
  }

  @override
  Future<List<RestaurantEntity>?> getRestaurants({int offset = 0}) async {
    try {
      final response = await dio.post('v3/graphql', data: restaurantsQuery(offset));
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final restaurantsData = data['data']['search']['business'];
        if (restaurantsData == null || restaurantsData.isEmpty) {
          return [];
        }
        return restaurantsData
            .map<RestaurantEntity>((r) => RestaurantMapper.fromInfrastructure(Restaurant.fromJson(r)))
            .toList();
      } else {
        throw _handleErrorResponse(response.statusCode);
      }
    } on AppException catch (_) {
      rethrow;
    } catch (e) {
      throw AppException(FetchAppError.networkError, 'Error fetching restaurants: $e');
    }
  }

  AppException _handleErrorResponse(int? statusCode) {
    switch (statusCode) {
      case 404:
        return AppException(FetchAppError.notFound, 'Restaurants not found');
      case 500:
        return AppException(FetchAppError.serverError, 'Server error');
      default:
        return AppException(FetchAppError.unknowError, 'Unknown error occurred');
    }
  }
}
