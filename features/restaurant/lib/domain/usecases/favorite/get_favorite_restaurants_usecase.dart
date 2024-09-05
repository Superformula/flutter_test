import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';

class GetFavoriteRestaurantsUsecase {
  final FavoriteRestaurantRepository _repository =
      SFInjector.instance.get<FavoriteRestaurantRepository>();

  Future<List<Restaurant>> execute() async {
    return await _repository.getFavoriteRestaurants();
  }
}
