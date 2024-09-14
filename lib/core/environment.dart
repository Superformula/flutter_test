import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = '';

  static Future<void> load() async {
    await dotenv.load();
    apiKey = dotenv.env['API_KEY'] ?? '';
  }
}
