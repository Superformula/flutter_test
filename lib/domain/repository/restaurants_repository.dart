import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantsRepository {
  RestaurantsRepository(
    this._restaurantsDatasource,
    this._favoriteRestaurantsDatasource,
  );

  final FavoriteRestaurantsDatasource _favoriteRestaurantsDatasource;
  final RestaurantsDatasource _restaurantsDatasource;
  final List<Restaurant> _restaurants = [];
  final Set<Restaurant> _favorites = {};

  Future<List<Restaurant>> getRestaurants() async {
    if (_restaurants.isEmpty) {
      final remoteRestaurants = await _restaurantsDatasource.getRestaurants();
      final favoritesRestaurants =
          await _favoriteRestaurantsDatasource.getFavoritesRestaurants();
      _restaurants.addAll(
        remoteRestaurants
            .map(
              (e) => favoritesRestaurants.contains(e)
                  ? e.copyWith(isFavorite: true)
                  : e,
            )
            .toList(),
      );
    }
    return _restaurants;
  }

  Future<void> getMoreRestaurants(int offset, int limit) async {
    final newRemoteRestaurants = await _restaurantsDatasource.getRestaurants(
      offset: offset,
      limit: limit,
    );
    _restaurants.addAll(
      newRemoteRestaurants
          .map(
            (e) => _favorites.contains(e) ? e.copyWith(isFavorite: true) : e,
          )
          .toList(),
    );
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    if (_favorites.isEmpty) {
      final favoritesRestaurants =
          await _favoriteRestaurantsDatasource.getFavoritesRestaurants();
      _favorites.addAll(
        favoritesRestaurants.map((e) => e.copyWith(isFavorite: true)),
      );
    }

    return _favorites.toList();
  }

  Future<void> addFavoriteRestaurant(Restaurant restaurant) async {
    _favorites.add(restaurant.copyWith(isFavorite: true));
    final restaurantIndex = _restaurants.indexWhere((e) => e == restaurant);
    if (restaurantIndex != -1) {
      _restaurants[restaurantIndex] = restaurant.copyWith(isFavorite: true);
      await _favoriteRestaurantsDatasource
          .addFavoriteRestaurant(restaurant.copyWith(isFavorite: true));
    }
  }

  Future<void> removeFavoriteRestaurant(Restaurant restaurant) async {
    final restaurantIndex = _restaurants.indexWhere((e) => e == restaurant);
    if (restaurantIndex != -1) {
      _restaurants[restaurantIndex] = restaurant.copyWith(isFavorite: false);
      _favorites.remove(restaurant);
      await _favoriteRestaurantsDatasource
          .removeFavoriteRestaurant(restaurant.copyWith(isFavorite: false));
    }
  }
}
