import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantsUsecase {
  const RestaurantsUsecase(this._repository);
  final RestaurantsRepository _repository;

  Future<List<Restaurant>> getRestaurants({
    List<String> filterByIds = const [],
  }) {
    return _repository.getRestaurants(filterByIds: filterByIds);
  }

  Future<Restaurant> getRestaurant(String id) {
    return _repository.getRestaurant(id);
  }

  Future<void> addFavoriteRestaurant(Restaurant restaurant) {
    return _repository.addFavoriteRestaurant(restaurant);
  }

  Future<void> removeFavoriteRestaurant(Restaurant restaurant) {
    return _repository.removeFavoriteRestaurant(restaurant);
  }
}
