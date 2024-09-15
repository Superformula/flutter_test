import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class MemoryFavoriteRestaurantsDatasource
    implements FavoriteRestaurantsDatasource {
  final List<String> _favoriteRestaurantsIds = [];
  @override
  Future<void> addFavoriteRestaurant(Restaurant restaurant) async {
    if (restaurant.id != null && restaurant.id!.isNotEmpty) {
      _favoriteRestaurantsIds.add(restaurant.id!);
    }
  }

  @override
  Future<List<String>> getListRestaurantsIds() {
    return Future.value(_favoriteRestaurantsIds);
  }

  @override
  Future<void> removeFavoriteRestaurant(Restaurant restaurant) async {
    if (restaurant.id != null && restaurant.id!.isNotEmpty) {
      _favoriteRestaurantsIds.remove(restaurant.id!);
    }
  }
}
