import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/datasources/restaurant_api_datasource.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late RestaurantApiDatasource datasource;

  setUp(() {
    mockClient = MockClient();
    datasource = RestaurantApiDatasource();
  });

  group('RestaurantApiDatasource', () {
    test(
        'returns RestaurantQueryResult if the http call completes successfully',
        () async {
      when(
        () => mockClient.post(
          Uri.parse('https://example.com'),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            mockQueryResult,
          }),
          200,
        ),
      );

      final result = await datasource.getRestaurants();

      expect(result.restaurants, isEmpty);
      expect(result.total, 0);
    });
  });
}
