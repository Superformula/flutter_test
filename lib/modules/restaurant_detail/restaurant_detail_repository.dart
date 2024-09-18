import 'package:restaurant_tour/core/database/database.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';

class RestaurantDetailRepository {
  final _favoriteRestaurantsDao = FavoriteRestaurantsDao();

  Future<void> addRestaurant({required Restaurant restaurant}) async {
    await _favoriteRestaurantsDao.insert(restaurant);
  }

  Future<void> deleteRestaurant({required String restaurantId}) async {
    await _favoriteRestaurantsDao.delete(restaurantId: restaurantId);
  }
}
