import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import 'models.dart';

class RestaurantModel {
  final String id;
  final List<CategoryModel> categories;
  final String displayCategory;
  final String heroImage;
  final bool isOpen;
  final String address;
  final String name;
  final List<String> photos;
  final String price;
  final int rating;
  final List<ReviewModel> reviews;

  RestaurantModel({
    required this.id,
    required this.categories,
    required this.displayCategory,
    required this.heroImage,
    required this.isOpen,
    required this.address,
    required this.name,
    required this.photos,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  factory RestaurantModel.fromEntity(RestaurantEntity entity) {
    return RestaurantModel(
      id: entity.id,
      rating: entity.rating,
      categories: entity.categories.map((category) => CategoryModel.fromEntity(category)).toList(),
      displayCategory: entity.displayCategory,
      heroImage: entity.heroImage,
      isOpen: entity.isOpen,
      address: entity.address,
      name: entity.name,
      photos: entity.photos,
      price: entity.price,
      reviews: entity.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
    );
  }

  factory RestaurantModel.fromJson(Map json) {
    try {
      return RestaurantModel(
        id: json['id'] ?? '',
        categories: (json['categories'] as List).map((item) => CategoryModel.fromJson(json)).toList(),
        displayCategory: json['displayCategory'] ?? '',
        heroImage: json['heroImage'] ?? '',
        isOpen: json['isOpen'] ?? true,
        address: json['address'] ?? '',
        name: json['name'] ?? '',
        photos: List.from(json['photos'] ?? []),
        price: json['price'] ?? '',
        rating: json['rating'] ?? 5,
        reviews: (json['reviews'] as List).map(((item) => ReviewModel.fromJson(item))).toList(),
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories.map((category) => category.toJson()).toList(),
      'displayCategory': displayCategory,
      'heroImage': heroImage,
      'isOpen': isOpen,
      'address': address,
      'photos': photos,
      'price': price,
      'rating': rating,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: id,
      rating: rating,
      categories: categories.map((category) => category.toEntity()).toList(),
      displayCategory: displayCategory,
      heroImage: heroImage,
      isOpen: isOpen,
      address: address,
      name: name,
      photos: photos,
      price: price,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  FavoriteRestaurantEntity toFavoriteEntity() {
    return FavoriteRestaurantEntity(
      id: id,
      rating: rating,
      categories: categories.map((category) => category.toEntity()).toList(),
      displayCategory: displayCategory,
      heroImage: heroImage,
      isOpen: isOpen,
      address: address,
      name: name,
      photos: photos,
      price: price,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }
}
