import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/http_service/http_client.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';

import '../models/restaurant.dart';

class YelpDevRepository implements YelpRepository {
  final IHttpClient client;

  YelpDevRepository({required this.client});

  @override
  Future<Option<RestaurantQueryResult>> getRestaurants({int offset = 0}) async {
    const baseUrl =
        'https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json';

    try {
      final response = await client.get(baseUrl);

      if (response.statusCode == 200) {
        return Some(
          RestaurantQueryResult.fromJson(
            jsonDecode(response.body)['data']['search'],
          ),
        );
      } else {
        print('Failed to load restaurants: ${response.statusCode}');
        return const None();
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      return const None();
    }
  }
}
