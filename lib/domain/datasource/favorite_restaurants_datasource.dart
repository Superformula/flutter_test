import 'package:restaurant_tour/models/restaurant.dart';

abstract class FavoriteRestaurantsDatasource {
  Future<void> addFavoriteRestaurant(Restaurant restaurant);
  Future<void> removeFavoriteRestaurant(Restaurant restaurant);
  Future<List<String>> getListRestaurantsIds();
}
