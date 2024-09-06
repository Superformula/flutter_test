import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import '../domain/models/restaurant.dart';
import '../domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import '../domain/repository/get_restaurant/get_restaurants_repository.dart';

const _apiKey = String.fromEnvironment('YELP_API_KEY');

class YelpRestaurantRepository implements GetRestaurantsRepository {
  late Dio dio;

  YelpRestaurantRepository({
    @visibleForTesting Dio? dio,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.yelp.com',
                headers: {
                  'Authorization': 'Bearer $_apiKey',
                  'Content-Type': 'application/graphql',
                },
              ),
            );

  @override
  Future<Either<GetRestaurantError, RestaurantQueryResult>> getRestaurants(
      {int offset = 0}) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getQuery(offset),
      );
      return Right(
        RestaurantQueryResult.fromJson(
          response.data?['data']['search'],
        ),
      );
    } catch (e) {
      return Left(
        GetRestaurantError(
          error: e.toString(),
        ),
      );
    }
  }

  String _getQuery(int offset) {
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
}
