import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ENV {
  static final env = dotenv.env;
  static String apiKey = env['API_KEY'] ?? '';
  static String baseUrl = env['BASE_URL'] ?? '';
}
