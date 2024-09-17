import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

/// {@template category}
/// A class representing a restaurant category, including the alias and title.
/// Used to categorize restaurants in a user-friendly way.
/// {@endtemplate}
@JsonSerializable()
class Category {
  /// {@macro category}
  Category({
    this.alias,
    this.title,
  });

  /// Factory method to create a [Category] object from a JSON map.
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// The alias of the category.
  final String? alias;

  /// The human-readable title of the category.
  final String? title;

  /// Converts the [Category] object into a JSON map.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

/// {@template hours}
/// A class representing the opening hours of a restaurant, indicating if it's
/// currently open.
/// {@endtemplate}
@JsonSerializable()
class Hours {
  /// {@macro hours}
  const Hours({
    this.isOpenNow,
  });

  /// Factory method to create a [Hours] object from a JSON map.
  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  /// A boolean indicating if the restaurant is currently open.
  @JsonKey(name: 'is_open_now')
  final bool? isOpenNow;

  /// Converts the [Hours] object into a JSON map.
  Map<String, dynamic> toJson() => _$HoursToJson(this);
}

/// {@template user}
/// A class representing a user who can leave reviews, including the user's ID,
/// image, and name.
/// {@endtemplate}
@JsonSerializable()
class User {
  /// {@macro user}
  const User({
    this.id,
    this.imageUrl,
    this.name,
  });

  /// Factory method to create a [User] object from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// The ID of the user.
  final String? id;

  /// The URL of the user's image.
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// The name of the user.
  final String? name;

  /// Converts the [User] object into a JSON map.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// {@template review}
/// A class representing a review of a restaurant, containing the review text,
/// rating, and user information.
/// {@endtemplate}
@JsonSerializable()
class Review {
  /// {@macro review}
  const Review({
    this.id,
    this.rating,
    this.user,
    this.text,
  });

  /// Factory method to create a [Review] object from a JSON map.
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  /// The ID of the review.
  final String? id;

  /// The rating given by the user.
  final int? rating;

  /// The review text provided by the user.
  final String? text;

  /// The user who left the review.
  final User? user;

  /// Converts the [Review] object into a JSON map.
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

/// {@template location}
/// A class representing the location of a restaurant, with a formatted address.
/// {@endtemplate}
@JsonSerializable()
class Location {
  /// {@macro location}
  Location({
    this.formattedAddress,
  });

  /// Factory method to create a [Location] object from a JSON map.
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// The formatted address of the restaurant.
  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;

  /// Converts the [Location] object into a JSON map.
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// {@template restaurant}
/// A class representing a restaurant, including its name, rating, categories,
/// and other relevant details.
/// {@endtemplate}
@JsonSerializable()
class Restaurant {
  /// {@macro restaurant}
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

  /// Factory method to create a [Restaurant] object from a JSON map.
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  /// The ID of the restaurant.
  final String? id;

  /// The name of the restaurant.
  final String? name;

  /// The price range of the restaurant, usually indicated by symbols like $.
  final String? price;

  /// The rating of the restaurant.
  final double? rating;

  /// A list of URLs of the restaurant's photos.
  final List<String>? photos;

  /// A list of categories that the restaurant belongs to.
  final List<Category>? categories;

  /// A list of opening hours for the restaurant.
  final List<Hours>? hours;

  /// A list of reviews for the restaurant.
  final List<Review>? reviews;

  /// The location of the restaurant.
  final Location? location;

  /// Converts the [Restaurant] object into a JSON map.
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  /// Retrieves the first category to display to the user.
  /// Returns an empty string if no categories are available.
  String get displayCategory {
    if (categories != null && categories!.isNotEmpty) {
      return categories!.first.title ?? '';
    }
    return '';
  }

  /// Retrieves the first image to display as the hero image.
  /// Returns an empty string if no photos are available.
  String get heroImage {
    if (photos != null && photos!.isNotEmpty) {
      return photos!.first;
    }
    return '';
  }

  /// Determines if the restaurant is currently open based on the first set of
  /// hours.
  /// Returns `false` if no hours are available.
  bool get isOpen {
    if (hours != null && hours!.isNotEmpty) {
      return hours!.first.isOpenNow ?? false;
    }
    return false;
  }
}

/// {@template restaurant_query_result}
/// A class representing the result of a restaurant search query, including the
/// total number of results and a list of restaurants.
/// {@endtemplate}
@JsonSerializable()
class RestaurantQueryResult {
  /// {@macro restaurant_query_result}
  const RestaurantQueryResult({
    this.total,
    this.restaurants,
  });

  /// Factory method to create a [RestaurantQueryResult] object from a JSON map.
  factory RestaurantQueryResult.fromJson(Map<String, dynamic> json) =>
      _$RestaurantQueryResultFromJson(json);

  /// The total number of restaurants found in the query.
  final int? total;

  /// The list of restaurants returned by the query.
  @JsonKey(name: 'business')
  final List<Restaurant>? restaurants;

  /// Converts the [RestaurantQueryResult] object into a JSON map.
  Map<String, dynamic> toJson() => _$RestaurantQueryResultToJson(this);
}
