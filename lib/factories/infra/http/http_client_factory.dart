import 'package:http/http.dart';

import '../../../../infra/http/http.dart';
import '../../../core/core.dart';

HttpAdapter makeHttpAdapter() {
  final client = Client();
  final headers = {
    'Content-Type': 'application/graphql',
    'Authorization': ENV.apiKey,
  };
  return HttpAdapter(client: client, headers: headers);
}
