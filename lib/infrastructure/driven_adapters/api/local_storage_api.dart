import 'dart:convert';
import 'package:restaurant_tour/domain/models/restaurant/gateway/local_storage_gateway.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

class LocalStorageApi implements LocalStorageGatewayInterface {
  final SharedPreferences prefs;

  LocalStorageApi({required this.prefs});

  @override
  Future<void> addFavoriteRestaurant(RestaurantEntity restaurant) async {
    final currentFavorites = await getFavoriteRestaurants();
    currentFavorites!.add(restaurant);

    final favoriteRestaurantsJson = currentFavorites.map((restaurant) {
      final restaurantInfra = RestaurantMapper.toInfrastructure(restaurant);
      return jsonEncode(restaurantInfra.toJson());
    }).toList();

    prefs.setStringList(AppConstants.keyFavoriteRestaurants, favoriteRestaurantsJson);
  }

  @override
  Future<void> deleteFavoriteRestaurant(String restaurantId) async {
    final currentFavorites = await getFavoriteRestaurants();
    currentFavorites!.removeWhere((restaurant) => restaurant.id == restaurantId);

    final favoriteRestaurantsJson = currentFavorites.map((restaurant) {
      final restaurantInfra = RestaurantMapper.toInfrastructure(restaurant);
      return jsonEncode(restaurantInfra.toJson());
    }).toList();

    prefs.setStringList(AppConstants.keyFavoriteRestaurants, favoriteRestaurantsJson);
  }

  @override
  Future<List<RestaurantEntity>?> getFavoriteRestaurants() async {
    final List<String>? favoriteRestaurantsJson = prefs.getStringList(AppConstants.keyFavoriteRestaurants);
    if (favoriteRestaurantsJson != null) {
      return favoriteRestaurantsJson.map((json) {
        final restaurantInfra = Restaurant.fromJson(jsonDecode(json));
        return RestaurantMapper.fromInfrastructure(restaurantInfra);
      }).toList();
    }
    return [];
  }

  @override
  bool isFavorite(String restaurantId) {
    final currentFavorites = prefs.getStringList(AppConstants.keyFavoriteRestaurants);
    if (currentFavorites != null) {
      return currentFavorites.any((json) {
        final restaurant = Restaurant.fromJson(jsonDecode(json));
        return restaurant.id == restaurantId;
      });
    }
    return false;
  }
}
