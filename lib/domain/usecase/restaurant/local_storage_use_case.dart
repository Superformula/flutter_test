import 'package:restaurant_tour/domain/models/restaurant/gateway/local_storage_gateway.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

class LocalStorageUseCase {
  final LocalStorageGatewayInterface localStorageGatewayInterface;

  LocalStorageUseCase({required this.localStorageGatewayInterface});

  Future<List<RestaurantEntity>?> getFavoriteRestaurants() {
    return localStorageGatewayInterface.getFavoriteRestaurants();
  }

  Future<void> addFavoriteRestaurant() {
    return localStorageGatewayInterface.addFavoriteRestaurant();
  }

  Future<void> deleteFavoriteRestaurant() {
    return localStorageGatewayInterface.deleteFavoriteRestaurant();
  }
}
