import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/restaurant_detail/bloc/restaurant_detail_bloc.dart';

void main() {
  group('RestaurantDetailState', () {
    test('RestaurantDetailLoading supports value comparisons', () {
      expect(
        const RestaurantDetailLoading(),
        const RestaurantDetailLoading(),
      );
    });

    test('RestaurantDetailLoaded supports value comparisons', () {
      expect(
        const RestaurantDetailLoaded(isFavorite: true),
        const RestaurantDetailLoaded(isFavorite: true),
      );
      expect(
        const RestaurantDetailLoaded(isFavorite: false),
        isNot(const RestaurantDetailLoaded(isFavorite: true)),
      );
    });
  });
}
