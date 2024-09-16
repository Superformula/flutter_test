import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRestaurantEntity extends Mock implements RestaurantEntity {}

class MockRestaurantMapper extends Mock implements RestaurantMapper {}

void main() {
  late FavoritesProvider favoritesProvider;
  late RestaurantEntity mockRestaurant;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      AppConstants.keyFavoriteRestaurants: [
        jsonEncode(
          {
            'id': '1',
            'name': 'Test Restaurant',
            'price': '\$\$',
            'rating': 4.5,
            'photos': ['https://example.com/photo.jpg'],
            'categories': [],
            'hours': [],
            'location': {'formatted_address': 'Test Address'},
            'reviews': [],
          },
        ),
      ],
    });
    favoritesProvider = FavoritesProvider();
    mockRestaurant = MockRestaurantEntity();
    when(() => mockRestaurant.id).thenReturn('2');
    when(() => mockRestaurant.name).thenReturn('Test Restaurant 2');
    when(() => mockRestaurant.price).thenReturn('\$\$');
    when(() => mockRestaurant.rating).thenReturn(4.5);
    when(() => mockRestaurant.photos).thenReturn(['https://example.com/photo2.jpg']);
    when(() => mockRestaurant.categories).thenReturn([]);
    when(() => mockRestaurant.hours).thenReturn([]);
    when(() => mockRestaurant.reviews).thenReturn([]);
    when(() => mockRestaurant.location).thenReturn(Location(formattedAddress: ''));
  });

  group('FavoritesProvider Tests', () {
    test('should load favorites from SharedPreferences', () async {
      final restaurantJson = jsonEncode(
        {
          'id': '1',
          'name': 'Test Restaurant',
          'price': '\$\$',
          'rating': 4.5,
          'photos': ['https://example.com/photo.jpg'],
          'categories': [],
          'hours': [],
          'location': {'formatted_address': 'Test Address'},
          'reviews': [],
        },
      );
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList(AppConstants.keyFavoriteRestaurants, [restaurantJson]);

      favoritesProvider = FavoritesProvider();
      await Future.delayed(Duration.zero);
      expect(favoritesProvider.isFavorite('1'), isTrue);

      expect(favoritesProvider.favoriteRestaurants.length, 1);
    });

    test('should toggle favorite and add restaurant', () async {
      expect(favoritesProvider.isFavorite('2'), isFalse);

      await favoritesProvider.toggleFavorite(mockRestaurant);

      expect(favoritesProvider.isFavorite('2'), isTrue);
      expect(favoritesProvider.favoriteRestaurants.length, 2);

      final prefs = await SharedPreferences.getInstance();
      final savedFavorites = prefs.getStringList(AppConstants.keyFavoriteRestaurants);
      expect(savedFavorites, isNotNull);
      expect(savedFavorites!.length, 2);
    });

    test('should remove restaurant from favorites', () async {
      mockRestaurant = MockRestaurantEntity();
      when(() => mockRestaurant.id).thenReturn('1');
      when(() => mockRestaurant.name).thenReturn('Test Restaurant');
      when(() => mockRestaurant.price).thenReturn('\$\$');
      when(() => mockRestaurant.rating).thenReturn(4.5);
      when(() => mockRestaurant.photos).thenReturn(['https://example.com/photo.jpg']);
      when(() => mockRestaurant.categories).thenReturn([]);

      await favoritesProvider.toggleFavorite(mockRestaurant);
      expect(favoritesProvider.isFavorite('1'), isFalse);
      expect(favoritesProvider.favoriteRestaurants.length, 0);
    });
  });
}
