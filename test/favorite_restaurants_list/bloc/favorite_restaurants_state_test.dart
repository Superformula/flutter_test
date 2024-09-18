import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';

void main() {
  group('FavoriteRestaurantsState', () {
    test('supports value comparisons for FavoriteRestaurantsLoading', () {
      expect(
        const FavoriteRestaurantsLoading(),
        equals(const FavoriteRestaurantsLoading()),
      );
    });

    test('supports value comparisons for FavoriteRestaurantsError', () {
      expect(
        const FavoriteRestaurantsError(message: 'error'),
        equals(const FavoriteRestaurantsError(message: 'error')),
      );
    });

    test('supports value comparisons for FavoriteRestaurantsData', () {
      final restaurants = [const Restaurant(id: '1', name: 'Restaurant 1')];
      expect(
        FavoriteRestaurantsData(restaurants: restaurants),
        equals(FavoriteRestaurantsData(restaurants: restaurants)),
      );
    });
  });
}
