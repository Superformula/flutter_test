import 'package:restaurant_tour/models/restaurant.dart';

abstract class RestaurantsDatasource {
  Future<List<Restaurant>> getRestaurants({int offset, int limit});
}
