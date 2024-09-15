import 'package:http/http.dart';

import '../../../infra/http/http.dart';

HttpAdapter makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}
