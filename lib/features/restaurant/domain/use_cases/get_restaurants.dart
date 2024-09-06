import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';

class GetRestaurants {
  final YelpRepository repository;

  GetRestaurants(this.repository);

  Future<Either<Failure, List<Restaurant>>> call() async {
    return repository.getRestaurantsFromRepo();
  }
}
