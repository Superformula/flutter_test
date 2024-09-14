import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Environment {
  static const String _baseUrl = 'https://api.yelp.com/v3/graphql';
  static final String _apiKey = dotenv.env['API_KEY_YELP'] ?? '';
}
