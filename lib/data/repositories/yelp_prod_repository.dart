import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/http_service/http_client.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';

import '../../env/env.dart';
import '../../core/query.dart';
import '../models/restaurant.dart';

class YelpProdRepository implements YelpRepository {
  final IHttpClient client;

  YelpProdRepository({required this.client});

  @override
  Future<Option<RestaurantQueryResult>> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer ${Env.yelpApiKey}',
      'Content-Type': 'application/graphql',
    };

    const baseUrl = 'https://api.yelp.com/v3/graphql';

    try {
      final response = await client.post(
        baseUrl,
        headers: headers,
        body: query(offset),
      );
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
