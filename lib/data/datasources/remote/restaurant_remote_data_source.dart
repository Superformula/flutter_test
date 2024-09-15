import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/data/dtos/restaurant_dto.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/data/repositories/datasource/restaurant_remote_data_source.dart';

class RestaurantRemoteDataSource extends BaseRestaurantRemoteDataSource {
  RestaurantRemoteDataSource({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<Result<List<Restaurant>, BaseError>> getRestaurants({
    int offset = 0,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getRestaurantsQuery(offset),
      );

      final data = RestaurantDto.fromJson(response.data!['data']['search']);

      if (data.restaurants != null) {
        return Success(data.restaurants!);
      }

      return Error(UnknownError());
    } on DioException catch (e) {
      // we could map all network errors here and create something to share the logic
      // here a simple example
      if (e.response?.statusCode == 400) {
        return Error(RateLimitError());
      }

      return switch (e.type) {
        DioExceptionType.badResponse => Error(UnknownError()),
        DioExceptionType.connectionTimeout => Error(TimeoutError()),
        DioExceptionType.connectionError => Error(NoInternetConnectionError()),
        _ => Error(UnknownError()),
      };
    } catch (e) {
      return Error(UnknownError());
    }
  }
}

String _getRestaurantsQuery(int offset) {
  return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
''';
}
