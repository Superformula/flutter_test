import 'dart:async';

import 'package:sembast/sembast.dart';

import 'package:restaurant_tour/core/database/app_database.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';

class FavoriteRestaurantsDao {
  static const String favoriteRestaurantsStoreName = 'favorite_restaurants';

  final _favoriteRestaurantsStore =
      intMapStoreFactory.store(favoriteRestaurantsStoreName);

  Future get _db async => AppDatabase().database;

  Future insert(Restaurant restaurant) async {
    await _favoriteRestaurantsStore.add(await _db, restaurant.toJson());
  }

  Future<List<Restaurant>> getAll() async {
    final list = await _favoriteRestaurantsStore.find(await _db);
    return list.map((e) => Restaurant.fromJson(e.value)).toList();
  }

  Future delete({required String restaurantId}) async {
    await _favoriteRestaurantsStore.delete(
      await _db,
      finder: Finder(
        filter: Filter.equals(
          'id',
          restaurantId,
        ),
      ),
    );
  }
}
