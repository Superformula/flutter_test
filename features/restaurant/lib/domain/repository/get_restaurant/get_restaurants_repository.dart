import 'package:either_dart/either.dart';
import '../../../domain/models/restaurant.dart';
import './errors/get_restaurant_errors.dart';

abstract class GetRestaurantsRepository {
  Future<Either<GetRestaurantError, RestaurantQueryResult>> getRestaurants(
      {int offset = 0});
}
