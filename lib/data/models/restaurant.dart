import 'package:restaurant_tour/data/models/category.dart';
import 'package:restaurant_tour/data/models/hours.dart';
import 'package:restaurant_tour/data/models/location.dart';
import 'package:restaurant_tour/data/models/review.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart'
    as restaurant_domain_model;

part 'restaurant.g.dart';

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

  const Restaurant({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.photos,
    this.categories,
    this.hours,
    this.reviews,
    this.location,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  restaurant_domain_model.Restaurant toDomain() =>
      restaurant_domain_model.Restaurant(
        id: id,
        name: name,
        price: price,
        rating: rating,
        photos: photos,
        categories: categories?.map((e) => e.toDomain()).toList(),
        hours: hours?.map((e) => e.toDomain()).toList(),
        reviews: reviews?.map((e) => e.toDomain()).toList(),
        location: location?.toDomain(),
      );

  factory Restaurant.fromDomain(restaurant_domain_model.Restaurant domain) =>
      Restaurant(
        id: domain.id,
        name: domain.name,
        price: domain.price,
        rating: domain.rating,
        photos: domain.photos,
        categories:
            domain.categories?.map((e) => Category.fromDomain(e)).toList(),
        hours: domain.hours?.map((e) => Hours.fromDomain(e)).toList(),
        reviews: domain.reviews?.map((e) => Review.fromDomain(e)).toList(),
        location: domain.location != null
            ? Location.fromDomain(domain.location!)
            : null,
      );
}
