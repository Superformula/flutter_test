import '../entities/entities.dart';

abstract class SaveFavoriteRestaurants {
  Future<void> call(List<RestaurantEntity> restaurant);
}
