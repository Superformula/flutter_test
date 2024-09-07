import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

import '../data/fake_restaurant.dart';

class FakeRestaurantsRepository extends BaseRestaurantsRepository {
  final List<Restaurant> favoriteRestaurants = [
    fakeRestaurant.toDomain(),
  ];

  List<Restaurant> get restaurants => [
        fakeRestaurant.toDomain(),
        fakeRestaurant2.toDomain(),
      ];

  @override
  Stream<List<Restaurant>> getFavorites() {
    return Stream.value(favoriteRestaurants);
  }

  @override
  Future<List<Restaurant>> getRestaurants({int offset = 0}) async {
    return restaurants;
  }

  @override
  void toggleFavorite(Restaurant restaurant) {
    final found = favoriteRestaurants
            .indexWhere((element) => element.id == restaurant.id) !=
        -1;

    if (found) {
      favoriteRestaurants.removeWhere((element) => element.id == restaurant.id);
    } else {
      favoriteRestaurants.add(restaurant);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
