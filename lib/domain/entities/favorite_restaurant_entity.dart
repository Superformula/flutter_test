import 'restaurant_entity.dart';

class FavoriteRestaurantEntity extends RestaurantEntity {
  FavoriteRestaurantEntity({
    required super.id,
    required super.categories,
    required super.isOpen,
    required super.address,
    required super.name,
    required super.photos,
    required super.price,
    required super.rating,
    required super.reviews,
  });
}
