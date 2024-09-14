import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Environment {
  static const String _baseUrl = 'https://api.yelp.com/v3/graphql';
  static final String _apiKey = dotenv.env['API_KEY_YELP'] ?? '';

  static Dio baseDioClient({String? url, String? key}) {
    final baseUrl = url ?? _baseUrl;
    final apiKey = key ?? _apiKey;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-type': 'application/graphql',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
