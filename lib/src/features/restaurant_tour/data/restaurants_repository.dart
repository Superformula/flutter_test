import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_tour/query.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class RestaurantsRepository {
  static const _apiKey =
      'y0RvKbozyu07RfpByqrdTJGyAOzhaNZH9T5X5pzBOoSh9uqOULc8h6yx89Z5nPjYtNaPHp9aqX0ZKF5pHSuYTeWcrYJS9r4EoHb7WmVLKPSmPW-L0FloXZJUInTkZnYx';
  static const _baseUrl = 'https://api.yelp.com/v3/graphql';

  static Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: query(offset),
      );

      if (response.statusCode == 200) {
        return RestaurantQueryResult.fromJson(
          jsonDecode(response.body)['data']['search'],
        );
      } else {
        print('Failed to load restaurants: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
    }
  }
}
