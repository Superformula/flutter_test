import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class YelpRepositoryContract {
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0});
}
