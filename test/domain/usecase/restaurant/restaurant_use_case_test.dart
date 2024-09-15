import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/domain/usecase/restaurant/restaurant_use_case.dart';

class MockRestaurantGateway extends Mock implements RestaurantGateway {}

class FakeRestaurantEntity extends Fake implements RestaurantEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRestaurantEntity());
  });

  group('RestaurantUseCase Tests', () {
    late RestaurantUseCase restaurantUseCase;
    late MockRestaurantGateway mockRestaurantGateway;

    setUp(() {
      mockRestaurantGateway = MockRestaurantGateway();
      restaurantUseCase = RestaurantUseCase(restaurantGateway: mockRestaurantGateway);
    });

    test('fetchRestaurants returns a list of restaurants', () async {
      final mockRestaurants = [
        RestaurantEntity(
          id: '1',
          name: 'Restaurant A',
          price: '\$',
          rating: 4.5,
          photos: [],
          categories: [],
          hours: [],
          reviews: [],
          location: Location(formattedAddress: '123 Main St'),
        ),
        RestaurantEntity(
          id: '2',
          name: 'Restaurant B',
          price: '\$\$',
          rating: 4.0,
          photos: [],
          categories: [],
          hours: [],
          reviews: [],
          location: Location(formattedAddress: '456 Elm St'),
        ),
      ];

      when(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset')))
          .thenAnswer((_) async => mockRestaurants);
      //act
      final result = await restaurantUseCase.fetchRestaurants();
      //assert
      expect(result, equals(mockRestaurants));
      expect(result, isNotNull);
      verify(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset'))).called(1);
    });

    test('fetchRestaurant returns a restaurant by id', () async {
      final mockRestaurant = RestaurantEntity(
        id: '1',
        name: 'Restaurant A',
        price: '\$',
        rating: 4.5,
        photos: [],
        categories: [],
        hours: [],
        reviews: [],
        location: Location(formattedAddress: '123 Main St'),
      );
      when(() => mockRestaurantGateway.getRestaurant('1')).thenAnswer((_) async => mockRestaurant);
      //act
      final result = await restaurantUseCase.fetchRestaurant('1');
      //assert
      expect(result, equals(mockRestaurant));
      verify(() => mockRestaurantGateway.getRestaurant('1')).called(1);
    });

    test('fetchRestaurants returns null when gateway returns null', () async {
      when(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset'))).thenAnswer((_) async => null);
      //act
      final result = await restaurantUseCase.fetchRestaurants();
      //assert
      expect(result, isNull);
      verify(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset'))).called(1);
    });

    test('fetchRestaurant returns null when gateway returns null', () async {
      when(() => mockRestaurantGateway.getRestaurant('1')).thenAnswer((_) async => null);
      //act
      final result = await restaurantUseCase.fetchRestaurant('1');
      //assert
      expect(result, isNull);
      verify(() => mockRestaurantGateway.getRestaurant('1')).called(1);
    });

    test('fetchRestaurants returns null on exception', () async {
      when(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset')))
          .thenAnswer((_) async => throw Exception('Error fetching restaurants'));
      final result = await restaurantUseCase.fetchRestaurants();
      expect(result, isNull);
      verify(() => mockRestaurantGateway.getRestaurants(offset: any(named: 'offset'))).called(1);
    });
  });
}
