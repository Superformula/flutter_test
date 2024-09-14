import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/restaurants_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late Restaurant restaurant1;
  late Restaurant restaurant2;

  setUp(() {
    mockHttpClient = MockHttpClient();
    restaurant1 = mockRestaurants[0];
    restaurant2 = mockRestaurants[1];

    RestaurantsRepository.restaurantsResponse = RestaurantQueryResult(
      restaurants: [restaurant1, restaurant2],
      total: 2,
    );
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
    test('Should return the restaurant with the matching id', () {
      final result = RestaurantsRepository.getFavoriteRestaurants('100');

      expect(result, contains(restaurant1));
      expect(result, isNot(contains(restaurant2)));
    });
  });
}
