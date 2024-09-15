import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

abstract class RestaurantRepository {
  Future<RestaurantQueryResult> getRestaurants();
}
