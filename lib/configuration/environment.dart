import 'package:dio/dio.dart';

// We should not expose any sensitive information in the code.
// Thus, we pass the baseUrl as well as the API Key as dart-defines.
// These values will come from the CI environment, which is a trustwhorty environement.
final class Environment {
  static const baseUrl = String.fromEnvironment('API_URL');
  static const apiKey = String.fromEnvironment('API_KEY');
  static const kDefaultTimeout = Duration(seconds: 15);

  static Dio createDioClient({String? url, String? key, Duration? cadidateTimeout}) {
    final baseUrl = url ?? Environment.baseUrl;
    final apiKey = key ?? Environment.apiKey;
    final timeout = cadidateTimeout ?? kDefaultTimeout;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/graphql',
        },
        sendTimeout: timeout,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        validateStatus: (status) => true,
      ),
    );
  }
}
