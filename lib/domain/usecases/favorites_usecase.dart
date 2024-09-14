import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';

class FavoritesUsecase implements FavoritesUsecaseContract {
  FavoritesUsecase({
    required FavoritesLocalStorageContract favoritesLocalStorge,
  }) : _favoritesLocalStorge = favoritesLocalStorge;

  final FavoritesLocalStorageContract _favoritesLocalStorge;

  @override
  Future<List<Restaurant>> getFavorites() async {
    return _favoritesLocalStorge.getFavorites();
  }

  @override
  Future<void> saveFavorite(Restaurant restaurant) async {
    return _favoritesLocalStorge.saveFavorite(restaurant);
  }

  @override
  Future<bool> isFavorite(Restaurant restaurant) async {
    final favorites = await _favoritesLocalStorge.getFavorites();
    return favorites.contains(restaurant);
  }

  @override
  Future<void> removeFavorite(Restaurant restaurant) async {
    return _favoritesLocalStorge.removeFavorite(restaurant);
  }
}
