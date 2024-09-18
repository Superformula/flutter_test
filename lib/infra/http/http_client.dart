abstract class HttpClient<ResponseType, DataType> {
  Future<ResponseType> request({
    required String url,
    required String method,
    DataType data,
  });
}
