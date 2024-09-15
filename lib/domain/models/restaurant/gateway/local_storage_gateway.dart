import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

abstract class LocalStorageGatewayInterface {
  Future<List<RestaurantEntity>?> getFavoriteRestaurants();
  Future<void> addFavoriteRestaurant();
  Future<void> deleteFavoriteRestaurant();
}
