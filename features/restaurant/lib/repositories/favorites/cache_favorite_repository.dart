import 'dart:convert';

import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';
import 'package:cache/cache.dart';

class CacheFavoriteRepository implements FavoriteRestaurantRepository {
  final SFCacheManager cacheManager = SFInjector.instance.get<SFCacheManager>();

  @override
  void addNewFavoriteRestaurant(Restaurant restaurant) {
    var json = restaurant.toJson();
    cacheManager.setString(
      'favorites_restaurants',
      jsonEncode(
        {
          'restaurants': [json]
        },
      ),
    );
  }

  @override
  Future<List<Restaurant>> getFavoriteRestaurants() async {
    String? restaurants = await cacheManager.getString('favorites_restaurants');
    if (restaurants == null) {
      return [];
    }
    List<Restaurant> restaurantsList = [];
    Map<String, dynamic> convertedList = jsonDecode(restaurants);
    for (var element in convertedList["restaurants"]) {
      restaurantsList.add(Restaurant.fromJson(element));
    }
    return restaurantsList;
  }

  @override
  Future<void> removeRestaurantFromFavorites(Restaurant restaurant) async {
    List<Restaurant> restaurants = await getFavoriteRestaurants();
    restaurants.removeWhere(
      (element) => element.id == restaurant.id,
    );

    cacheManager.setString(
      "favorites_restaurants",
      jsonEncode(
        {'restaurants': restaurants.map((e) => e.toJson()).toList()},
      ),
    );
  }
}
