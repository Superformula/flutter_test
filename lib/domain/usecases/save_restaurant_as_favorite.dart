import '../entities/entities.dart';

abstract class SaveRestaurantAsFavorite {
  Future<void> call(RestaurantEntity restaurant);
}
