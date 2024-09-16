import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  List<RestaurantEntity> _favoriteRestaurants = [];

  FavoritesProvider() {
    _loadFavorites();
  }

  List<RestaurantEntity> get favoriteRestaurants => _favoriteRestaurants;
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteRestaurantsJson = prefs.getStringList(AppConstants.keyFavoriteRestaurants);
    if (favoriteRestaurantsJson != null) {
      _favoriteRestaurants = favoriteRestaurantsJson.map((json) {
        final restaurantInfra = Restaurant.fromJson(jsonDecode(json));
        return RestaurantMapper.fromInfrastructure(restaurantInfra);
      }).toList();
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(RestaurantEntity restaurant) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteRestaurants.any((r) => r.id == restaurant.id)) {
      _favoriteRestaurants.removeWhere((r) => r.id == restaurant.id);
    } else {
      _favoriteRestaurants.add(restaurant);
    }

    final favoriteRestaurantsJson = _favoriteRestaurants.map((restaurant) {
      final restaurantInfra = RestaurantMapper.toInfrastructure(restaurant);
      return jsonEncode(restaurantInfra.toJson());
    }).toList();

    prefs.setStringList(AppConstants.keyFavoriteRestaurants, favoriteRestaurantsJson);
    notifyListeners();
  }

  bool isFavorite(String restaurantId) {
    return _favoriteRestaurants.any((r) => r.id == restaurantId);
  }
}
