import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';

class GetFavorites {
  final YelpRepository repository;

  GetFavorites(this.repository);

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getFavorites();
  }
}
