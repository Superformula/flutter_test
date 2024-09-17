// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_gql_client/src/query/query.dart';
import 'package:restaurant_models/restaurant_models.dart';

/// {@template restaurant_gql_client}
/// Restaurant gql client
/// {@endtemplate}
class RestaurantGqlClient {
  /// {@macro restaurant_gql_client}
  RestaurantGqlClient(http.Client client) : _client = client;

  final http.Client _client;

  final _apiKey =
      'roS-1EKDfvra02o49ijcGyuMKiAbNE0DmyQRr_r3O6mvQZURUi4MN6jZkrvEnM8pTof4FZmvHXti0aEkySa0sk5qVZneTHaVfBz-DNzgaACBEil3ArqEcs9kEZfoZnYx';
  final _baseUrl = 'https://api.yelp.com/v3/graphql';

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await _client.post(
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
