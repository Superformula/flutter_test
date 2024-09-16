import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantsRepository {
  const RestaurantsRepository(
    this._restaurantsDatasource,
    this._favoriteRestaurantsDatasource,
  );

  final FavoriteRestaurantsDatasource _favoriteRestaurantsDatasource;
  final RestaurantsDatasource _restaurantsDatasource;
  Future<List<Restaurant>> getRestaurants() {
    return _restaurantsDatasource.getRestaurants();
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    final favoriteRestaurantIds =
        await _favoriteRestaurantsDatasource.getListRestaurantsIds();
    return _restaurantsDatasource.getRestaurants(
      filterByIds: favoriteRestaurantIds,
    );
  }

  Future<Restaurant> getRestaurant(String id) {
    return _restaurantsDatasource.getRestaurant(id);
  }

  Future<void> addFavoriteRestaurant(Restaurant restaurant) {
    return _favoriteRestaurantsDatasource.addFavoriteRestaurant(restaurant);
  }

  Future<void> removeFavoriteRestaurant(Restaurant restaurant) {
    return _favoriteRestaurantsDatasource.removeFavoriteRestaurant(restaurant);
  }
}
