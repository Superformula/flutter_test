import 'package:http/http.dart';

import '../../../infra/http/http.dart';

HttpAdapter makeHttpAdapter() {
  final client = Client();
  final headers = {
    'Content-Type': 'application/graphql',
    'Authorization':
        'Bearer 1hH9pW24WpBHxamMbgShaygY4eqRSW5NZq3e6eVImPkhFU8RR4KHIZ59pJ0D5YL4GCizkxjdxegx1f5igGGQuVEMER8gR-Jo8JpT1V6D3OUjUcucwL8uF5pxNqzlZnYx',
  };
  return HttpAdapter(client: client, headers: headers);
}
