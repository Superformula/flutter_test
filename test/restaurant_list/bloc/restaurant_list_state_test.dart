import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';

void main() {
  group('RestaurantListState', () {
    test('supports value comparisons for RestaurantListLoading', () {
      expect(
        const RestaurantListLoading(),
        equals(const RestaurantListLoading()),
      );
    });

    test('supports value comparisons for RestaurantListError', () {
      expect(
        const RestaurantListError(message: 'error'),
        equals(const RestaurantListError(message: 'error')),
      );
    });

    test('supports value comparisons for RestaurantListData', () {
      final restaurants = [const Restaurant(id: '1', name: 'Restaurant 1')];
      expect(
        RestaurantListData(restaurants: restaurants),
        equals(RestaurantListData(restaurants: restaurants)),
      );
    });

    test('supports value comparisons for RestaurantDetail', () {
      const restaurant = Restaurant(id: '1', name: 'Restaurant 1');
      expect(
        const RestaurantDetail(restaurant: restaurant),
        equals(const RestaurantDetail(restaurant: restaurant)),
      );
    });
  });
}
