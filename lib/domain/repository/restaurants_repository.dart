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
  Future<List<Restaurant>> getRestaurants({
    List<String> filterByIds = const [],
  }) {
    return _restaurantsDatasource.getRestaurants(filterByIds: filterByIds);
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
