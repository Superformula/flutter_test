import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

///Entity defining the data
class Restaurant {
  final String? id;
  final String? name;
  final String? price;
  final double? rating;
  final List<String>? photos;
  final List<Category>? categories;
  final List<Hours>? hours;
  final List<Review>? reviews;
  final Location? location;
  final bool? isFavorite;
  Restaurant({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.photos,
    required this.categories,
    required this.hours,
    required this.reviews,
    required this.location,
    required this.isFavorite,
  });
}
