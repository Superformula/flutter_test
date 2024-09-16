import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/category_model.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/hour_model.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/location_model.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/review_model.dart';

class RestaurantEntity {
  final String id;
  final String name;
  final String price;
  final double rating;
  final List<String> photos;
  final List<ReviewModel> reviews;
  final List<CategoryModel> categories;
  final List<HourModel> hours;
  final LocationModel location;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.photos,
    required this.reviews,
    required this.categories,
    required this.hours,
    required this.location,
  });
}