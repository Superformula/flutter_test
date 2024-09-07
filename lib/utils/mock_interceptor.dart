import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == '/v3/graphql') {
      // Load the mock JSON data from the assets folder
      final mockData = await _loadMockResponse();
      return handler.resolve(
        Response(
          requestOptions: options,
          data: mockData,
          statusCode: 200,
          statusMessage: 'OK',
        ),
      );
    }

    // If no match, continue with the real network request
    return handler.next(options);
  }

  // Load mock data from JSON file
  Future<Map<String, dynamic>> _loadMockResponse() async {
    final jsonString = await rootBundle.loadString('mock_response.json');
    return jsonDecode(jsonString);
  }
}