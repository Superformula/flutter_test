import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

class GetRestaurantsUseCase {
  final BaseRestaurantsRepository _restaurantsRepository;

  GetRestaurantsUseCase({
    required BaseRestaurantsRepository restaurantsRepository,
  }) : _restaurantsRepository = restaurantsRepository;

  Future<List<Restaurant>?> call() {
    return _restaurantsRepository.getRestaurants();
  }
}
