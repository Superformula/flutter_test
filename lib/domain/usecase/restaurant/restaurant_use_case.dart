import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

class RestaurantUseCase {
  final RestaurantGateway restaurantGateway;

  RestaurantUseCase({required this.restaurantGateway});

  Future<List<Restaurant>?> getRestaurants() {
    return restaurantGateway.getRestaurants();
  }

  Future<Restaurant?> getRestaurant(String id) {
    return restaurantGateway.getRestaurant(id);
  }
}
