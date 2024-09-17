import 'entities.dart';

class RestaurantEntity {
  final String id;
  final List<CategoryEntity> categories;
  final bool isOpen;
  final String address;
  final String name;
  final List<String> photos;
  final String price;
  final double rating;
  final List<ReviewEntity> reviews;

  RestaurantEntity({
    required this.id,
    required this.categories,
    required this.isOpen,
    required this.address,
    required this.name,
    required this.photos,
    required this.price,
    required this.rating,
    required this.reviews,
  });
}
