import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';

class MockRestaurantGateway extends Mock implements RestaurantGateway {}

void main() {
  late RestaurantProvider restaurantProvider;
  late MockRestaurantGateway mockRestaurantGateway;

  setUp(() {
    mockRestaurantGateway = MockRestaurantGateway();
    restaurantProvider = RestaurantProvider(restaurantGateway: mockRestaurantGateway);
  });

  group('RestaurantProvider Tests', () {
    test('should fetch and load restaurants successfully with pagination', () async {
      // Arrange
      final List<RestaurantEntity> mockRestaurantsPage1 = [
        RestaurantEntity(
          id: '1',
          name: 'Restaurant 1',
          price: '\$\$',
          rating: 4.5,
          categories: [],
          hours: [],
          location: Location(formattedAddress: 'Address 1'),
          photos: ['https://example.com/photo1.jpg'],
          reviews: [],
        ),
      ];
      final List<RestaurantEntity> mockRestaurantsPage2 = [
        RestaurantEntity(
          id: '2',
          name: 'Restaurant 2',
          price: '\$\$',
          rating: 4.5,
          categories: [],
          hours: [],
          location: Location(formattedAddress: 'Address 2'),
          photos: ['https://example.com/photo2.jpg'],
          reviews: [],
        ),
      ];

      when(() => mockRestaurantGateway.getRestaurants(offset: 0)).thenAnswer((_) async => mockRestaurantsPage1);
      when(() => mockRestaurantGateway.getRestaurants(offset: 1)).thenAnswer((_) async => mockRestaurantsPage2);

      // Act
      await restaurantProvider.getRestaurants();

      // Assert
      expect(restaurantProvider.restaurants, mockRestaurantsPage1);
      expect(restaurantProvider.restaurants?.length, 1);

      expect(restaurantProvider.isLoading, isFalse);
      expect(restaurantProvider.errorMessage, isNull);
    });

    test('should handle error when fetching restaurants', () async {
      // Arrange
      when(() => mockRestaurantGateway.getRestaurants(offset: 0)).thenThrow(Exception('Failed to fetch restaurants'));

      // Act
      await restaurantProvider.getRestaurants();

      // Assert
      expect(restaurantProvider.restaurants, isEmpty);
      expect(restaurantProvider.isLoading, isFalse);
    });

    test('should indicate loading state while fetching restaurants', () async {
      // Arrange
      final List<RestaurantEntity> mockRestaurants = [
        RestaurantEntity(
          id: '1',
          name: 'Restaurant 1',
          price: '\$\$',
          rating: 4.5,
          categories: [],
          hours: [],
          location: Location(formattedAddress: 'Address 1'),
          photos: ['https://example.com/photo1.jpg'],
          reviews: [],
        ),
      ];

      when(() => mockRestaurantGateway.getRestaurants(offset: 0)).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 1));
        return mockRestaurants;
      });

      // Act
      final future = restaurantProvider.getRestaurants();

      // Assert
      expect(restaurantProvider.isLoading, isTrue);
      await future;

      // Assert
      expect(restaurantProvider.isLoading, isFalse);
      expect(restaurantProvider.restaurants, mockRestaurants);
    });
  });
}
