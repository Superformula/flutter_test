import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/data/datasources/local/provider/base_database_provider.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/data/repositories/datasource/restaurant_local_data_source.dart';
import 'package:sembast/sembast.dart';

class RestaurantLocalDataSource extends BaseRestaurantLocalDataSource {
  RestaurantLocalDataSource({
    required BaseDatabaseProvider databaseProvider,
  }) : _databaseProvider = databaseProvider;

  final BaseDatabaseProvider _databaseProvider;

  Database get _db => _databaseProvider.database;

  StoreRef<String, Map<String, Object?>> get _store =>
      stringMapStoreFactory.store('restaurants');

  StoreRef<String, Map<String, Object?>> get _favoritesStore =>
      stringMapStoreFactory.store('favorites_restaurants');

  @override
  Future<Result<List<Restaurant>, BaseError>> getRestaurants() async {
    try {
      final data = await _store.find(_db);
      final restaurants =
          data.map((e) => Restaurant.fromJson(e.value)).toList();
      return Success(restaurants);
    } catch (e) {
      return Error(ReadLocalDataError());
    }
  }

  @override
  Future<Result<void, BaseError>> insertRestaurants(
    List<Restaurant> restaurants,
  ) async {
    try {
      await _store.addAll(_db, restaurants.map((e) => e.toJson()).toList());

      await _db.transaction((txn) async {
        for (final restaurant in restaurants) {
          await _store.record(restaurant.id!).put(txn, restaurant.toJson());
        }
      });

      return Success.unit();
    } catch (e) {
      return Error(SaveDataError());
    }
  }

  @override
  Stream<List<Restaurant>> getFavorites() {
    return _favoritesStore.query().onSnapshotsSync(_db).map((snapshot) {
      return snapshot.map((e) => Restaurant.fromJson(e.value)).toList();
    });
  }

  @override
  Future<Result<void, BaseError>> toggleFavorite(Restaurant restaurant) async {
    try {
      final recordId = restaurant.id!;
      final exists = await _favoritesStore.record(recordId).get(_db);

      if (exists != null) {
        await _favoritesStore.record(recordId).delete(_db);
        return Success.unit();
      }

      _favoritesStore.record(recordId).put(_db, restaurant.toJson());

      return Success.unit();
    } catch (e) {
      // we could map a more specific error here, but for now, we will just return a generic error
      return Error(SaveDataError());
    }
  }
}
