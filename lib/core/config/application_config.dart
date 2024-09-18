import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApplicationConfig {
  static Future<void> setUp() async {
    await _loadEnv();
  }

  static Future<void> _loadEnv() async {
    await dotenv.load();
  }
}
