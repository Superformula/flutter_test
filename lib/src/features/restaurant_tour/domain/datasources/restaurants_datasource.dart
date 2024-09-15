import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

abstract class RestaurantsDatasource {
  Future<RestaurantQueryResult> getRestaurants();
}
