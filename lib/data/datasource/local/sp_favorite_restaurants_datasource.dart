import 'dart:convert';

import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpFavoriteRestaurantsDatasource implements FavoriteRestaurantsDatasource {
  final String _favoriteResturantsKey = 'spFavoritesRestaurants';
  final SharedPreferences _sharedPreferences;
  SpFavoriteRestaurantsDatasource(this._sharedPreferences);
  @override
  Future<void> addFavoriteRestaurant(Restaurant restaurant) async {
    final result = _sharedPreferences.getStringList(_favoriteResturantsKey);
    final restaurantJsonString = jsonEncode(restaurant.toJson());
    if (result == null) {
      _sharedPreferences
          .setStringList(_favoriteResturantsKey, [restaurantJsonString]);
    } else {
      result.add(restaurantJsonString);
      _sharedPreferences.setStringList(_favoriteResturantsKey, result);
    }
  }

  @override
  Future<List<Restaurant>> getFavoritesRestaurants() async {
    final result = _sharedPreferences.getStringList(_favoriteResturantsKey);

    return result?.map((e) => Restaurant.fromJson(jsonDecode(e))).toList() ??
        [];
  }

  @override
  Future<void> removeFavoriteRestaurant(Restaurant restaurant) async {
    final result = _sharedPreferences.getStringList(_favoriteResturantsKey);
    result?.removeWhere(
      (restaurantJsonString) => restaurantJsonString.contains(restaurant.id!),
    );
    _sharedPreferences.setStringList(_favoriteResturantsKey, result ?? []);
  }
}
