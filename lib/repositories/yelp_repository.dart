import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getQuery(offset),
      );
      return RestaurantQueryResult.fromJson(response.data!['data']['search']);
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
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
