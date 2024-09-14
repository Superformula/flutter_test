import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant.dart';

abstract class LocalStorageGatewayInterface {
  Future<List<Restaurant>?> getFavoriteRestaurants();
  Future<void> addFavoriteRestaurant();
  Future<void> deleteFavoriteRestaurant();
}
