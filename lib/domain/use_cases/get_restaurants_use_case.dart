import 'package:multiple_result/multiple_result.dart';

import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

class GetRestaurantsUseCase {
  final BaseRestaurantsRepository _restaurantsRepository;

  GetRestaurantsUseCase({
    required BaseRestaurantsRepository restaurantsRepository,
  }) : _restaurantsRepository = restaurantsRepository;

  Future<Result<List<Restaurant>, BaseError>> call() {
    return _restaurantsRepository.getRestaurants();
  }
}
