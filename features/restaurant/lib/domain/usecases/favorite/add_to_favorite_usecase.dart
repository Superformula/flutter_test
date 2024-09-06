import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';

class AddToFavoriteUseCase {
  final FavoriteRestaurantRepository _favoriteRestaurantRepository =
      SFInjector.instance.get<FavoriteRestaurantRepository>();

  void favorite(Restaurant restaurant) {
    _favoriteRestaurantRepository.addNewFavoriteRestaurant(restaurant);
  }
}
