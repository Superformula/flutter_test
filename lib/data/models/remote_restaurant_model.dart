import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import 'models.dart';

class RemoteRestaurantModel {
  final String id;
  final List<CategoryModel> categories;
  final bool isOpen;
  final String address;
  final String name;
  final List<String> photos;
  final String price;
  final double rating;
  final List<ReviewModel> reviews;

  RemoteRestaurantModel({
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

  factory RemoteRestaurantModel.fromJson(Map json) {
    try {
      return RemoteRestaurantModel(
        id: json['id'] ?? '',
        categories: (json['categories'] as List).map((item) => CategoryModel.fromJson(json)).toList(),
        isOpen: (json['hours'] ?? []).first['is_open_now'] ?? true,
        address: json['location']['formatted_address'] ?? '',
        name: json['name'] ?? '',
        photos: List.from(json['photos'] ?? []),
        price: json['price'] ?? '',
        rating: json['rating'] ?? 5.0,
        reviews: (json['reviews'] as List).map(((item) => ReviewModel.fromJson(item))).toList(),
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: id,
      rating: rating,
      categories: categories.map((category) => category.toEntity()).toList(),
      isOpen: isOpen,
      address: address,
      name: name,
      photos: photos,
      price: price,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }
}
