import 'dart:convert';

import 'package:http/http.dart';

import 'http.dart';

class HttpAdapter implements HttpClient<Map, String?> {
  final Client _client;

  HttpAdapter(this._client);

  @override
  Future<Map> request({required String url, required String method, String? data}) async {
    final headers = {'content-type': 'application/json', 'accept': 'application/json'};
    final uri = Uri.parse(url);
    var response = Response('', 500);

    try {
      if (method == 'post') {
        response = await _client.post(uri, headers: headers, body: data);
      }
    } catch (_) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else {
      throw HttpError.serverError;
    }
  }
}
