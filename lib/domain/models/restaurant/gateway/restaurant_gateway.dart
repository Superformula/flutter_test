import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

abstract class RestaurantGateway {
  Future<List<Restaurant>?> getRestaurants({int offset = 0});
  Future<Restaurant?> getRestaurant(String id);
}
