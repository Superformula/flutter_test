import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oxidized/oxidized.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';

class YelpRepository {
  late Dio dio;

  YelpRepository() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.yelp.com',
        headers: {
          'Authorization': 'Bearer ${dotenv.env['YELP_API_KEY']}',
          'Content-Type': 'application/graphql',
        },
      ),
    );
  }

  Future<Result<RestaurantQueryResult, DioException>> getRestaurants(
      {int offset = 0}) async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/restaurants.json');
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      // final response = await dio.post<Map<String, dynamic>>(
      //   '/v3/graphql',
      //   data: _getQuery(offset),
      // );
      // final result = RestaurantQueryResult.fromJson(response.data!['data']['search']);
      final result =
          RestaurantQueryResult.fromJson(jsonResponse['data']['search']);
      return Ok(result);
    } catch (e) {
      return Err(
        DioException(
          requestOptions: RequestOptions(path: 'path'),
          error: e.toString(),
        ),
      );
      // if(e is DioException) {
      //   return Err(e);
      // } else {
      //   return Err(
      //     DioException(
      //       requestOptions: RequestOptions(path: '/v3/graphql'),
      //       error: e,
      //     ),
      //   );
      // }
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
