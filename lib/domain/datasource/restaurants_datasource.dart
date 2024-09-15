import 'package:restaurant_tour/models/restaurant.dart';

abstract class RestaurantsDatasource {
  Future<List<Restaurant>> getRestaurants({
    List<String> filterByIds = const [],
  });
  Future<Restaurant> getRestaurant(String id);
}
