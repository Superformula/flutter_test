import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/local_storage_gateway.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/usecase/restaurant/local_storage_use_case.dart';

class FavoritesProvider extends ChangeNotifier {
  final LocalStorageGatewayInterface localStorageGateway;
  final LocalStorageUseCase localStorageUseCase;

  List<RestaurantEntity> _favoriteRestaurants = [];

  FavoritesProvider({required this.localStorageGateway})
      : localStorageUseCase = LocalStorageUseCase(localStorageGatewayInterface: localStorageGateway) {
    _loadFavorites();
  }

  List<RestaurantEntity> get favoriteRestaurants => _favoriteRestaurants;

  Future<void> _loadFavorites() async {
    _favoriteRestaurants = (await localStorageUseCase.getFavoriteRestaurants()) ?? [];
    notifyListeners();
  }

  Future<void> toggleFavorite(RestaurantEntity restaurant) async {
    if (isFavorite(restaurant.id)) {
      await localStorageUseCase.deleteFavoriteRestaurant(restaurant.id);
      _favoriteRestaurants.removeWhere((r) => r.id == restaurant.id);
    } else {
      await localStorageUseCase.addFavoriteRestaurant(restaurant);
      _favoriteRestaurants.add(restaurant);
    }
    notifyListeners();
  }

  bool isFavorite(String restaurantId) {
    return _favoriteRestaurants.any((r) => r.id == restaurantId);
  }
}
