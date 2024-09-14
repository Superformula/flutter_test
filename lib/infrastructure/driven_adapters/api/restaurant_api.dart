import 'package:restaurant_tour/domain/exception/app_exception.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:restaurant_tour/utils/restaurants_query.dart';

class RestaurantApi extends RestaurantGateway {
  late Dio dio;
  @override
  Future<Restaurant> getRestaurant(String id) {
    // TODO: implement getRestaurant

    throw UnimplementedError();
  }

  @override
  Future<List<Restaurant>?> getRestaurants({int offset = 0}) async {
    try {
      final response = await dio.post('/v3/graphql', data: restaurantsQuery(offset));
      if (response.statusCode == 200) {
        final restaurantsData = RestaurantQueryResult.fromJson(
          jsonDecode(response.data!)['data']['search'],
        );
        return restaurantDataToRestaurants(restaurantsData)
            .where((restaurant) => restaurant != null)
            .cast<Restaurant>()
            .toList();
      } else {
        switch (response.statusCode) {
          case 404:
            throw AppException(FetchAppError.notFound, 'Restaurants not found');
          case 500:
            throw AppException(FetchAppError.serverError, 'Server error');
          default:
            throw AppException(FetchAppError.unknowError, 'Unknown error occurred');
        }
      }
    } catch (e) {
      throw AppException(FetchAppError.networkError, 'Error fetching restaurants: $e');
    }
  }
}
