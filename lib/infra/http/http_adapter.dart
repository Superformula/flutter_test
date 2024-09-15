import 'dart:convert';

import 'package:http/http.dart';

import 'http.dart';

class HttpAdapter implements HttpClient {
  final Client _client;

  HttpAdapter(this._client);

  @override
  Future<Map?> request({required String url, required String method, Map? data}) async {
    final headers = {'content-type': 'application/json', 'accept': 'application/json'};
    final uri = Uri.parse(url);
    var response = Response('', 500);

    try {
      if (method == 'get') {
        response = await _client.get(uri, headers: headers);
      }
    } catch (_) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  Map? _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbbiden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
