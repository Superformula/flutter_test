import 'package:dartz/dartz.dart';
import '../../../models/restaurant.dart';
import '../../failures/failures.dart';
import '../repositories/home_repository_interface.dart';

class GetAllRestaurants {
  final HomeRepositoryInterface repository;

  const GetAllRestaurants(this.repository);

  Future<Either<RestaurantsFailure, RestaurantQueryResult>> call() =>
      repository.getAllRestaurants();
}
