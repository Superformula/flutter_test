import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';

abstract class YelpRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurantsFromRepo(
      {int offset = 0});

  Future markFavorite(String id);

  Future<Either<Failure, List<String>>> getFavorites();
}
