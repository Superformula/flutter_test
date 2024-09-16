import 'dart:convert';

import 'package:http/http.dart';

import 'http.dart';

class HttpAdapter implements HttpClient<Map, String?> {
  final Client _client;
  final Map<String, String> _headers;

  HttpAdapter({
    required Client client,
    required Map<String, String> headers,
  })  : _client = client,
        _headers = headers;

  @override
  Future<Map> request({required String url, required String method, String? data}) async {
    final uri = Uri.parse(url);
    var response = Response('', 500);

    try {
      if (method == 'post') {
        response = await _client.post(uri, headers: _headers, body: data);
      }
    } catch (_) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else {
      throw HttpError.serverError;
    }
  }
}
