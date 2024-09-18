import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class MemoryFavoriteRestaurantsDatasource
    implements FavoriteRestaurantsDatasource {
  final List<Restaurant> _favoritesRestaurants = [];
  @override
  Future<void> addFavoriteRestaurant(Restaurant restaurant) async {
    if (restaurant.id != null && restaurant.id!.isNotEmpty) {
      _favoritesRestaurants.add(restaurant);
    }
  }

  @override
  Future<void> removeFavoriteRestaurant(Restaurant restaurant) async {
    if (restaurant.id != null && restaurant.id!.isNotEmpty) {
      _favoritesRestaurants.remove(restaurant);
    }
  }

  @override
  Future<List<Restaurant>> getFavoritesRestaurants() {
    return Future.value(_favoritesRestaurants);
  }
}
