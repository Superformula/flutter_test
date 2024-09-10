import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/providers/restaurant_provider.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  group('FavoritesNotifier', () {
    late FavoritesNotifier favoritesNotifier;
    late ProviderContainer container;

    setUp(() {
      // Set up the provider container for Riverpod and the FavoritesNotifier instance
      container = ProviderContainer();
      favoritesNotifier = container.read(favoritesListProvider.notifier);
    });

    tearDown(() {
      // Clean up after each test
      container.dispose();
    });

    test('Initial state should be an empty list', () {
      expect(favoritesNotifier.state, isEmpty);
    });

    test('Adding a restaurant to favorites should increase the list count', () {
      // Arrange
      final restaurant = Restaurant(id: '1', name: 'Best Restaurant');

      // Act
      favoritesNotifier.toggleFavorite(restaurant);

      // Assert
      expect(favoritesNotifier.state.length, 1);
      expect(favoritesNotifier.state.first, equals(restaurant));
    });

    test('Removing a restaurant from favorites should decrease the list count', () {
      // Arrange
      final restaurant = Restaurant(id: '1', name: 'Best Restaurant');

      // Act - Add the restaurant first
      favoritesNotifier.toggleFavorite(restaurant);

      // Act - Remove the restaurant
      favoritesNotifier.toggleFavorite(restaurant);

      // Assert
      expect(favoritesNotifier.state, isEmpty);
    });

    test('Toggling a favorite twice should leave the list unchanged', () {
      // Arrange
      final restaurant = Restaurant(id: '1', name: 'Best Restaurant');

      // Act - Add and then remove the restaurant
      favoritesNotifier.toggleFavorite(restaurant);
      favoritesNotifier.toggleFavorite(restaurant);

      // Assert
      expect(favoritesNotifier.state, isEmpty);
    });

    test('Toggling a second restaurant should maintain both in the list', () {
      // Arrange
      final restaurant1 = Restaurant(id: '1', name: 'Restaurant 1');
      final restaurant2 = Restaurant(id: '2', name: 'Restaurant 2');

      // Act - Add both restaurants
      favoritesNotifier.toggleFavorite(restaurant1);
      favoritesNotifier.toggleFavorite(restaurant2);

      // Assert
      expect(favoritesNotifier.state.length, 2);
      expect(favoritesNotifier.state.contains(restaurant1), isTrue);
      expect(favoritesNotifier.state.contains(restaurant2), isTrue);
    });
  });
}
