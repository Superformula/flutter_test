import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

class GetFavoriteRestaurantsUseCase {
  final BaseRestaurantsRepository _restaurantsRepository;

  GetFavoriteRestaurantsUseCase({
    required BaseRestaurantsRepository restaurantsRepository,
  }) : _restaurantsRepository = restaurantsRepository;

  Stream<List<Restaurant>> call() {
    return _restaurantsRepository.getFavorites();
  }
}
