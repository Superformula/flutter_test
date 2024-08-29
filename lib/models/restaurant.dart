import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    required String alias,
    required String title,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) => _$CategoryFromJson(json);
}

@freezed
sealed class Hours with _$Hours {
  const factory Hours({
    @JsonKey(name: 'is_open_now') required bool open,
  }) = _Hours;

  factory Hours.fromJson(Map<String, Object?> json) => _$HoursFromJson(json);
}

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String name,
    String? imageUrl,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
sealed class Review with _$Review {
  const factory Review({
    required String id,
    required int rating,
    required String text,
    required User user,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}

@freezed
sealed class Location with _$Location {
  const factory Location({
    required String formattedAddress,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) => _$LocationFromJson(json);
}

@freezed
sealed class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    String? price,
    double? rating,
    List<String>? photos,
    List<Category>? categories,
    required List<Hours> hours,
    required List<Review> reviews,
    required Location location,
  }) = _Restaurant;

  const Restaurant._();

  factory Restaurant.fromJson(Map<String, Object?> json) => _$RestaurantFromJson(json);

  /// The first category, if any.
  Category? get mainCategory => categories?.firstOrNull;

  /// Whether the business is currently open.
  bool get open => hours.any((hour) => hour.open);
}

@freezed
sealed class RestaurantQueryResult with _$RestaurantQueryResult {
  const factory RestaurantQueryResult({
    required int total,
    @JsonKey(name: 'business') required List<Restaurant> restaurants,
  }) = _RestaurantQueryResult;

  factory RestaurantQueryResult.fromJson(Map<String, Object?> json) => _$RestaurantQueryResultFromJson(json);
}
