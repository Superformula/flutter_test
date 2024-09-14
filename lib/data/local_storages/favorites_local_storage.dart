import 'dart:convert';

import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

class FavoritesLocalStorage implements FavoritesLocalStorageContract {
  FavoritesLocalStorage({required StorageInterface storage})
      : _storage = storage;

  final StorageInterface _storage;

  final String key = 'favorites';

  @override
  Future<List<Restaurant>> getFavorites() async {
    final json = await _storage.read('favorites');
    if (json == null) {
      return [];
    }
    final maps = jsonDecode(json) as List;
    return maps.map((e) => Restaurant.fromJson(e)).toList();
  }

  @override
  Future<void> saveFavorite(Restaurant restaurant) async {
    final favorites = await getFavorites();
    favorites.add(restaurant);
    await _storage.write(
      'favorites',
      jsonEncode(favorites.map((e) => e.toJson()).toList()),
    );
  }

  @override
  Future<void> removeFavorite(Restaurant restaurant) async {
    final favorites = await getFavorites();
    favorites.removeWhere((e) => e.id == restaurant.id);
    await _storage.write(
      'favorites',
      jsonEncode(favorites.map((e) => e.toJson()).toList()),
    );
  }
}
