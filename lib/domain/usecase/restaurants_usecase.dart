import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantsUsecase {
  const RestaurantsUsecase(this._repository);
  final RestaurantsRepository _repository;

  Future<List<Restaurant>> getRestaurants() {
    return _repository.getRestaurants();
  }

  Future<List<Restaurant>> getFavoriteRestaurants() {
    return _repository.getFavoriteRestaurants();
  }

  Future<void> addFavoriteRestaurant(Restaurant restaurant) {
    return _repository.addFavoriteRestaurant(restaurant);
  }

  Future<void> removeFavoriteRestaurant(Restaurant restaurant) {
    return _repository.removeFavoriteRestaurant(restaurant);
  }

  Future loadMoreRestaurants({required int offset, required int limit}) {
    return _repository.getMoreRestaurants(offset, limit);
  }
}
