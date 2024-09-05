import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';

class CheckRestaurantFavoritedUseCase {
  final FavoriteRestaurantRepository _favoriteRestaurantRepository =
      SFInjector.instance.get<FavoriteRestaurantRepository>();

  Future<bool> isFavorited(Restaurant restaurant) async {
    List<Restaurant> favorites =
        await _favoriteRestaurantRepository.getFavoriteRestaurants();

    return favorites
        .where(
          (element) => element.id == restaurant.id,
        )
        .isNotEmpty;
  }
}
