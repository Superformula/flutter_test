import 'package:dartz/dartz.dart';
import '../../models/restaurant.dart';
import '../../failures/failures.dart';

abstract class HomeRepositoryInterface {
  Future<Either<RestaurantsFailure, Map<String, RestaurantQueryResult>>>
      getAllRestaurants();
}
