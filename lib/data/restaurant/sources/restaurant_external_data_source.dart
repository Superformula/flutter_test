import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/app/app.dart';

class RestaurantExternalDataSource {
  static const _baseUrl = 'https://api.yelp.com/v3/graphql';

  Future<List<Restaurant>> fetchRestaurants({int offset = 0}) async {
    await Future.delayed(const Duration(seconds: 5));

    final useFakeData = dotenv.env['USE_FAKE_DATA'] == 'true';

    if (useFakeData) {
      return RestaurantQueryResult.fromJson(fakeRestaurants).restaurants ?? [];
    }

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer ${Environment.apiKey}',
        'Content-Type': 'application/graphql',
      },
      body: getRestaurantsQuery(offset),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List<dynamic> restaurantList =
          jsonResponse['data']['search']['business'];
      return restaurantList.map((r) => Restaurant.fromJson(r)).toList();
    } else {
      throw RestaurantCustomException(
        error: response.body,
        message: 'Failed to fetch restaurants.',
      );
    }
  }
}
