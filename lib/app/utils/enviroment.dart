import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static late String apiKey;

  static Future<void> load() async {
    await dotenv.load();
    apiKey = dotenv.env['YELP_API_KEY'] ?? '';
  }
}
