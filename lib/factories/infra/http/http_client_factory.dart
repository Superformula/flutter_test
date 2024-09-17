import 'package:http/http.dart';

import '../../../../infra/http/http.dart';

HttpAdapter makeHttpAdapter() {
  final client = Client();
  final headers = {
    'Content-Type': 'application/graphql',
    'Authorization':
        'Bearer Ea0b8FWXPxS9mv3nTITKruISxVsKVPqW02EP4egupETca6psxfSgIjgAxKBYxOCu0LSluKYwBJWI15YPJXfL6aVRdxCGhP8uhQXcTpBVMn8NPIN8zU7_K3iTJuzoZnYx',
  };
  return HttpAdapter(client: client, headers: headers);
}
