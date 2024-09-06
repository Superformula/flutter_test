import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';

class RemoveFromFavoriteUseCase {
  final FavoriteRestaurantRepository _favoriteRestaurantRepository =
      SFInjector.instance.get<FavoriteRestaurantRepository>();

  Future<void> remove(Restaurant restaurant) async {
    await _favoriteRestaurantRepository
        .removeRestaurantFromFavorites(restaurant);
  }
}
