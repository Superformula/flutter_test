import 'dart:developer';
import 'package:dio/dio.dart';

class CurlInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(dio2curl(options));
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

String dio2curl(RequestOptions requestOption) {
  var curl = '';

  curl += 'curl --request ${requestOption.method} \'${requestOption.uri}\' \n';

  // Include headers
  for (var key in requestOption.headers.keys) {
    curl += ' -H \'$key: ${requestOption.headers[key]}\' \n';
  }

  // Include data if there is data
  if (requestOption.data != null) {
    curl += ' --data-binary \'${requestOption.data}\'';
  }

  return curl;
}