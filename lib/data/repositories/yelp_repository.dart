import 'dart:convert';

import 'package:restaurant_tour/core/http_service/http_client.dart';

import '../../env/env.dart';
import '../models/restaurant.dart';
import '../../query.dart';

class YelpRepository {
  final IHttpClient client;

  YelpRepository({required this.client});

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer ${Env.yelpApiKey}',
      'Content-Type': 'application/graphql',
    };

    const baseUrl = 'https://api.yelp.com/v3/graphql';

    try {
      print(headers);

      // final response =
      //     await client.post(baseUrl, headers: headers, body: query(offset),);

      final response = await client.get(
          url:
              'https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json');

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
