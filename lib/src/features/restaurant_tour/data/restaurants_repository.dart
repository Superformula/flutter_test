import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_tour/src/constants/constants.dart';
import 'package:restaurant_tour/src/constants/query.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class RestaurantsRepository {
  static const _apiKey = apiKey;
  static const _baseUrl = baseUrl;

  static RestaurantQueryResult? restaurantsResponse;

// API call to get restaurant information
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
        restaurantsResponse = RestaurantQueryResult.fromJson(
          jsonDecode(response.body)['data']['search'],
        );
        return restaurantsResponse;
      } else {
        print('Failed to load restaurants: ${response.statusCode}');
        return null;
      }
      // TODO: Uncomment if you want to use the app with Mocks
      // return _restaurantsResponse = RestaurantQueryResult(
      //   restaurants: mockRestaurants,
      //   total: 5,
      // );
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
    }
  }

// Method to validate favorite restaurants
  static List<Restaurant> getFavoriteRestaurants(String id) {
    var favoriteRestaurants = <Restaurant>[];

    for (var restaurant in restaurantsResponse?.restaurants ?? []) {
      if (restaurant.id == id) {
        favoriteRestaurants.add(restaurant);
      }
    }
    return favoriteRestaurants;
  }
}
