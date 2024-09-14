import 'dart:convert';

import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

class RestaurantsLocalStorage implements RestaurantsLocalStorageContract {
  RestaurantsLocalStorage({
    required StorageInterface localStorage,
  }) : _localStorage = localStorage;

  final StorageInterface _localStorage;

  final restaurantsKey = 'restaurants';

  @override
  Future<void> saveRestaurants(List<Restaurant> restaurants) async {
    final mapList =
        restaurants.map((restaurant) => restaurant.toJson()).toList();

    await _localStorage.write(
      restaurantsKey,
      jsonEncode(mapList),
    );
  }

  @override
  Future<List<Restaurant>> getCachedRestaurants() async {
    final json = await _localStorage.read(restaurantsKey);
    if (json == null) {
      return [];
    }
    final List<dynamic> mapList = jsonDecode(json);
    return mapList.map((map) => Restaurant.fromJson(map)).toList();
  }
}
