import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

class ToggleFavoriteUseCase {
  final BaseRestaurantsRepository _restaurantsRepository;

  ToggleFavoriteUseCase({
    required BaseRestaurantsRepository restaurantsRepository,
  }) : _restaurantsRepository = restaurantsRepository;

  void call(Restaurant restaurant) {
    return _restaurantsRepository.toggleFavorite(restaurant);
  }
}
