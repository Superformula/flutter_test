import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvService {
  static final DotenvService _instance = DotenvService._internal();

  factory DotenvService() => _instance;

  DotenvService._internal();

  late String _environment;

  Future<void> init() async {
    _environment = _getEnvironment();
    await dotenv.load(fileName: 'environments/.env.$_environment');
  }

  String _getEnvironment() => const String.fromEnvironment(
        'environment',
        defaultValue: 'dev',
      );

  static final apiKey = dotenv.get('API_KEY');
  static final apiUrl = dotenv.get('API_URL');
}
