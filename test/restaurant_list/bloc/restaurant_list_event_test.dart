import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';

void main() {
  group('RestaurantListEvent', () {
    test('supports value comparisons for FetchRestaurantList', () {
      expect(
        const FetchRestaurantList(),
        equals(const FetchRestaurantList()),
      );
    });

    test('supports value comparisons for GoToRestaurantDetail', () {
      const restaurant = Restaurant(id: '1', name: 'Restaurant 1');
      expect(
        const GoToRestaurantDetail(restaurant: restaurant),
        equals(const GoToRestaurantDetail(restaurant: restaurant)),
      );
    });
  });
}
