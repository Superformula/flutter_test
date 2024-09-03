import 'dart:convert';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRestaurantUtils {
  static const String _favoritesKey = 'favorite_restaurants';

  /// Saves a list of [Restaurant] objects to SharedPreferences.
  static Future<void> updateFavoriteRestaurants(
      List<Restaurant> restaurants) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> restaurantStrings = restaurants
        .map((restaurant) => jsonEncode(restaurant.toJson()))
        .toList();

    await prefs.setStringList(_favoritesKey, restaurantStrings);
  }

  /// Retrieves the list of favorite [Restaurant] objects from SharedPreferences.
  static Future<List<Restaurant>> getFavoriteRestaurants() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? restaurantStrings = prefs.getStringList(_favoritesKey);

    if (restaurantStrings != null) {
      return restaurantStrings
          .map((restaurantString) =>
              Restaurant.fromJson(jsonDecode(restaurantString)))
          .toList();
    } else {
      return [];
    }
  }
}
