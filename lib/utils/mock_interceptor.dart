import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Check if the request is for the GraphQL endpoint
    if (options.path == '/v3/graphql') {
      if (options.data.contains('business(id:')) {
        // Single restaurant request
        final restaurantId = _extractRestaurantId(options.data);
        if (restaurantId != null) {
          final mockData = await _loadMockSingleRestaurantResponse(restaurantId);
          if (mockData != null) {
            return handler.resolve(
              Response(
                requestOptions: options,
                data: mockData,
                statusCode: 200,
                statusMessage: 'OK',
              ),
            );
          }
        }
      } else if (options.data.contains('search')) {
        // List of restaurants request
        final mockListData = await _loadMockListResponse();
        return handler.resolve(
          Response(
            requestOptions: options,
            data: mockListData,
            statusCode: 200,
            statusMessage: 'OK',
          ),
        );
      }
    }

    // If no match, continue with the real network request
    return handler.next(options);
  }

  // Extract restaurant ID from GraphQL query
  String? _extractRestaurantId(String query) {
    final regex = RegExp(r'business\(id: "(.*?)"\)');
    final match = regex.firstMatch(query);
    return match?.group(1);
  }

  // Load mock single restaurant response based on restaurant ID
  Future<Map<String, dynamic>?> _loadMockSingleRestaurantResponse(String restaurantId) async {
    try {
      final jsonString = await rootBundle.loadString('mock_favorite_response.json');
      final jsonResponse = jsonDecode(jsonString);

      // Ensure the mock data contains the restaurant for the given ID
      if (jsonResponse['data']['business']['id'] == restaurantId) {
        return jsonResponse;
      }
    } catch (e) {
      print('Error loading mock single restaurant data: $e');
    }
    return null;
  }

  // Load mock list response for the list of restaurants
  Future<Map<String, dynamic>?> _loadMockListResponse() async {
    try {
      // Load the mock list response from a different JSON file
      final jsonString = await rootBundle.loadString('mock_response.json');
      return jsonDecode(jsonString);
    } catch (e) {
      print('Error loading mock list data: $e');
    }
    return null;
  }
}
