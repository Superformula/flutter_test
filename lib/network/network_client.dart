abstract class INetworkClient {
  Future<Map<String, dynamic>> post(
    String url, {
    required data,
    Map<String, String>? headers,
  });
}
