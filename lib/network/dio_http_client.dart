import 'package:dio/dio.dart';

import 'network_client.dart';

class DioHttpClient implements INetworkClient {
  final Dio dio;

  DioHttpClient({required this.dio});
  @override
  Future<Map<String, dynamic>> post(
    String url, {
    required data,
    Map<String, String>? headers,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      url,
      data: data,
      options: headers != null ? Options(headers: headers) : null,
    );
    return response.data!;
  }
}
