import '../entities/entities.dart';

abstract class GetFavoriteRestaurants {
  Future<List<FavoriteRestaurantEntity>> call();
}
