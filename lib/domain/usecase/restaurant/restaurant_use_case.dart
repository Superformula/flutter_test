import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';

class RestaurantUseCase {
  final RestaurantGateway restaurantGateway;

  RestaurantUseCase({required this.restaurantGateway});

  Future<List<RestaurantEntity>?> fetchRestaurants({int offset = 0}) async {
    try {
      return await restaurantGateway.getRestaurants(offset: offset);
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
    }
  }

  Future<RestaurantEntity?> fetchRestaurant(String id) async {
    try {
      return await restaurantGateway.getRestaurant(id);
    } catch (e) {
      print('Error fetching restaurant: $e');
      return null;
    }
  }
}
