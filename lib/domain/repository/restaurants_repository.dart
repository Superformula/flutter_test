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
  Future<List<Restaurant>> getRestaurants() async {
    final favoriteRestaurantIds =
        await _favoriteRestaurantsDatasource.getListRestaurantsIds();
    final restaurants = await _restaurantsDatasource.getRestaurants();

    return restaurants
        .map(
          (e) => favoriteRestaurantIds.contains(e.id!)
              ? e.copyWith(isFavorite: true)
              : e,
        )
        .toList();
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    final favoriteRestaurantIds =
        await _favoriteRestaurantsDatasource.getListRestaurantsIds();
    if (favoriteRestaurantIds.isEmpty) {
      return [];
    }
    final favoriteRestaurants = await _restaurantsDatasource.getRestaurants(
      filterByIds: favoriteRestaurantIds,
    );

    return favoriteRestaurants
        .map((e) => e.copyWith(isFavorite: true))
        .toList();
    ;
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
