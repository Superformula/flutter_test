import 'package:dartz/dartz.dart';

import '../models/restaurant.dart';

abstract class YelpRepository {
  Future<Option<RestaurantQueryResult>> getRestaurants({int offset = 0});
}
