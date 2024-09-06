import 'package:restaurant/domain/models/restaurant.dart';

abstract class FavoriteRestaurantRepository {
  Future<List<Restaurant>> getFavoriteRestaurants();

  void addNewFavoriteRestaurant(Restaurant restaurant);

  Future<void> removeRestaurantFromFavorites(Restaurant restaurant);
}
