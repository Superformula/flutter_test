import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class RestaurantsLocalStorageContract {
  Future<void> saveRestaurants(List<Restaurant> restaurants);
  Future<List<Restaurant>> getCachedRestaurants();
}
