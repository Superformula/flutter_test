import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/restaurant_detail/bloc/restaurant_detail_bloc.dart';

void main() {
  group('RestaurantDetailEvent', () {
    final restaurant = Restaurant(
      id: '1',
      name: 'Test Restaurant',
      price: '\$\$',
      rating: 4.5,
      photos: ['photo_url'],
      categories: [],
      hours: [],
      reviews: [],
      location: Location(formattedAddress: '123 Test St'),
    );

    test('FetchRestaurantIsFavorite supports value comparisons', () {
      expect(
        FetchRestaurantIsFavorite(restaurant: restaurant),
        FetchRestaurantIsFavorite(restaurant: restaurant),
      );
    });

    test('ToggleRestaurantFavorite supports value comparisons', () {
      expect(
        ToggleRestaurantFavorite(restaurant: restaurant),
        ToggleRestaurantFavorite(restaurant: restaurant),
      );
    });
  });
}
