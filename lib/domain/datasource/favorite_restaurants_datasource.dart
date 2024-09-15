import 'package:restaurant_tour/models/restaurant.dart';

abstract class FavoriteRestaurantsDatasource {
  Future<void> addFavoriteRestaurant(Restaurant restaurant);
  Future<void> removeFavoriteRestaurant(Restaurant restaurant);
  //TODO(darwin): Review this and decide if returning List<String> or List of restaurants.
  Future<List<String>> getListRestaurantsIds();
}
