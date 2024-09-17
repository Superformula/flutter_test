import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

abstract class LocalStorageGatewayInterface {
  Future<List<RestaurantEntity>?> getFavoriteRestaurants();
  Future<void> addFavoriteRestaurant(RestaurantEntity restaurant);
  Future<void> deleteFavoriteRestaurant(String restaurantId);
  bool isFavorite(String restaurantId);
}
