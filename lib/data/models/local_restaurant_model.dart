import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import 'models.dart';

class LocalRestaurantModel {
  final String id;
  final List<CategoryModel> categories;
  final bool isOpen;
  final String address;
  final String name;
  final List<String> photos;
  final String price;
  final double rating;
  final List<ReviewModel> reviews;

  LocalRestaurantModel({
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

  factory LocalRestaurantModel.fromJson(Map json) {
    try {
      return LocalRestaurantModel(
        id: json['id'],
        categories: (json['categories'] as List).map((item) => CategoryModel.fromJson(json)).toList(),
        isOpen: json['is_open'],
        address: json['address'],
        name: json['name'],
        photos: List.from(json['photos']),
        price: json['price'],
        rating: json['rating'],
        reviews: (json['reviews'] as List).map(((item) => ReviewModel.fromJson(item))).toList(),
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categories': categories.map((category) => category.toJson()).toList(),
      'is_open': isOpen,
      'address': address,
      'photos': photos,
      'price': price,
      'rating': rating,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  factory LocalRestaurantModel.fromEntity(RestaurantEntity entity) {
    return LocalRestaurantModel(
      id: entity.id,
      rating: entity.rating,
      categories: entity.categories.map((category) => CategoryModel.fromEntity(category)).toList(),
      isOpen: entity.isOpen,
      address: entity.address,
      name: entity.name,
      photos: entity.photos,
      price: entity.price,
      reviews: entity.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
    );
  }

  FavoriteRestaurantEntity toEntity() {
    return FavoriteRestaurantEntity(
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
