import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_tour/src/constants/constants.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/domain/datasources/restaurants_datasource.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

import '../../../../constants/query.dart';

class RestaurantApiDatasource extends RestaurantsDatasource {
  static const _apiKey = apiKey;
  static const _baseUrl = baseUrl;

  @override
  Future<RestaurantQueryResult> getRestaurants({int offset = 0}) async {
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
        final restaurantResponse = RestaurantQueryResult.fromJson(
          jsonDecode(response.body)['data']['search'],
        );
        return restaurantResponse;
      } else {
        return const RestaurantQueryResult(restaurants: [], total: 0);
      }
      // TODO: Uncomment if you want to use the app with Mocks
      // final restaurantsResponse = RestaurantQueryResult(
      //   restaurants: mockRestaurants,
      //   total: 5,
      // );
      // return restaurantsResponse;
    } catch (e) {
      print('Error fetching restaurants: $e');
      rethrow;
    }
  }
}
