// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:restaurant_gql_client/src/query/query.dart';
import 'package:restaurant_models/restaurant_models.dart';

/// {@template api_exception}
/// Custom exception for handling API errors with status codes and messages.
/// {@endtemplate}
class ApiException implements Exception {
  /// {@macro api_exception}
  ApiException(this.statusCode, this.message);

  /// HTTP status code of the API response.
  final int statusCode;

  /// Error message returned or custom message if any.
  final String message;

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message)';
}

/// {@template restaurant_gql_client}
/// A client for interacting with the restaurant GraphQL API to fetch
/// restaurant data such as reviews, categories, and location.
/// {@endtemplate}
class RestaurantGqlClient {
  /// {@macro restaurant_gql_client}
  RestaurantGqlClient(http.Client client, String baseUrl, String apiKey)
      : _client = client,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  /// Fetches restaurants from the GraphQL API with an optional [offset] for
  /// pagination.
  ///
  /// Returns a [RestaurantQueryResult] or throws an [ApiException] if the
  /// request fails.
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
        final data = jsonDecode(response.body)['data']['search'];
        return RestaurantQueryResult.fromJson(data);
      } else {
        log(
          'Failed to fetch restaurants: ${response.statusCode},'
          ' ${response.body}',
        );
        throw ApiException(response.statusCode, 'Failed to load restaurants');
      }
    } catch (e) {
      log('Error fetching restaurants: $e');
      throw ApiException(500, 'An unexpected error occurred: $e');
    }
  }
}
