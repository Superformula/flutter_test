import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';

void main() {
  group('FavoriteRestaurantsEvent', () {
    test('supports value comparisons for FetchFavoriteRestaurants', () {
      expect(
        const FetchFavoriteRestaurants(),
        equals(const FetchFavoriteRestaurants()),
      );
    });
  });
}
