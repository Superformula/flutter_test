import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/restaurants_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  group('getRestaurants', () {
    test('Should return null when status code is different from 200', () async {
      when(
        () => mockHttpClient.post(
          Uri.parse('https://api.yelp.com/v3/graphql'),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Error', 400),
      );

      final result = await RestaurantsRepository.getRestaurants();

      expect(result, isNull);
    });
  });
}
