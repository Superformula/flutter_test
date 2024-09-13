import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<dynamic> post<T>(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future get({
    required String url,
  });
}

class HttpClient implements IHttpClient {
  final http.Client client;

  HttpClient(this.client);

  @override
  Future<dynamic> post<T>(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(path),
        headers: headers,
        body: body,
      );

      return Future.value(response.body);
    } catch (e) {
      throw Exception('An error happened: $e');
    }
  }

  @override
  Future get({
    required String url,
  }) async {
    return await client.get(Uri.parse(url));
  }
}
