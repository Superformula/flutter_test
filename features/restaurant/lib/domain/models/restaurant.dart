import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant/domain/value_objects/name.dart';
import 'package:ui_kit/ui_kit.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Category {
  final String? alias;
  final String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Hours {
  @JsonKey(name: 'is_open_now')
  final bool? isOpenNow;

  const Hours({
    this.isOpenNow,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late Name name;

  User({
    required this.id,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var convertedClass = _$UserFromJson(json);
    convertedClass.name = Name.fromFullName(json["name"]);
    return convertedClass;
  }

  Map<String, dynamic> toJson() {
    var userToJson = _$UserToJson(this);
    userToJson["name"] = name.fullName;
    return userToJson;
  }
}

@JsonSerializable()
class Review {
  final String id;
  final int rating;
  final String? text;
  final User user;

  const Review({
    required this.id,
    required this.rating,
    required this.user,
    this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'formatted_address')
  final String formattedAddress;

  Location({
    required this.formattedAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Restaurant {
  final String id;
  final String name;
  final String price;
  final double rating;
  final List<String>? photos;
  final List<Category>? categories;
  final List<Hours>? hours;
  final List<Review> reviews;
  final Location location;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String status = "";
  @JsonKey(includeFromJson: false, includeToJson: false)
  late Color statusColor;
  @JsonKey(includeFromJson: true, includeToJson: true)
  bool isFavorite = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String priceWithCategory = "";

  Restaurant(
      {required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required this.location,
      required this.reviews,
      this.photos,
      this.categories,
      this.hours,
      this.isFavorite = false});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var converted = _$RestaurantFromJson(json);
    converted.status = converted.isOpen ? "Open" : "Closed";
    converted.statusColor = converted.isOpen ? AppColors.open : AppColors.red;
    converted.priceWithCategory =
        "${converted.price} ${converted.categories?.first.title ?? ''}";
    return converted;
  }

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  /// Use the first category for the category shown to the user
  String get displayCategory {
    if (categories != null && categories!.isNotEmpty) {
      return categories!.first.title ?? '';
    }
    return '';
  }

  /// Use the first image as the image shown to the user
  String get heroImage {
    if (photos != null && photos!.isNotEmpty) {
      return photos!.first;
    }
    return '';
  }

  /// This logic is probably not correct in all cases but it is ok
  /// for this application
  bool get isOpen {
    if (hours != null && hours!.isNotEmpty) {
      return hours!.first.isOpenNow ?? false;
    }
    return false;
  }
}

@JsonSerializable()
class RestaurantQueryResult {
  final int total;
  @JsonKey(name: 'business')
  final List<Restaurant> restaurants;

  const RestaurantQueryResult({
    required this.total,
    required this.restaurants,
  });

  factory RestaurantQueryResult.fromJson(Map<String, dynamic> json) =>
      _$RestaurantQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantQueryResultToJson(this);
}
