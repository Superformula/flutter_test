import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

abstract class RestaurantGateway {
  Future<List<RestaurantEntity>?> getRestaurants({int offset = 0});
  Future<RestaurantEntity?> getRestaurant(String id);
}
