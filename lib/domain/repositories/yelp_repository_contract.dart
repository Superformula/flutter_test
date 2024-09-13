import 'package:restaurant_tour/data/models/restaurant.dart';

abstract class YelpRepositoryContract {
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0});
}
