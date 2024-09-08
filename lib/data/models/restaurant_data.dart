import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_data.freezed.dart';
part 'restaurant_data.g.dart';

@freezed
class RestaurantDataQuery with _$RestaurantDataQuery {
  const factory RestaurantDataQuery({
    required int total,
    @JsonKey(name: 'business') required List<RestaurantData> restaurants,
  }) = _RestaurantDataQuery;

  factory RestaurantDataQuery.fromJson(Map<String, Object?> json) => _$RestaurantDataQueryFromJson(json);
}

@freezed
class RestaurantData with _$RestaurantData {
  const factory RestaurantData({
    required String id,
    required String name,
    required String price,
    required double rating,
    required List<String> photos,
    required List<RestaurantReviewData> reviews,
    required List<RestaurantCategoryData> categories,
    required List<RestaurantLocationData> location,
    required List<RestaurantAvailabilityData> hours,
    @Default(false) isFavorite,
  }) = _RestaurantData;

  factory RestaurantData.fromJson(Map<String, Object?> json) => _$RestaurantDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) => _$UserDataFromJson(json);
}

@freezed
class RestaurantReviewData with _$RestaurantReviewData {
  const factory RestaurantReviewData({
    required String id,
    required double rating,
    required String text,
    required UserData user,
  }) = _RestaurantReviewData;

  factory RestaurantReviewData.fromJson(Map<String, Object?> json) => _$RestaurantReviewDataFromJson(json);
}

@freezed
class RestaurantCategoryData with _$RestaurantCategoryData {
  const factory RestaurantCategoryData({
    required String title,
    required String alias,
  }) = _RestaurantCategoryData;

  factory RestaurantCategoryData.fromJson(Map<String, Object?> json) => _$RestaurantCategoryDataFromJson(json);
}

@freezed
class RestaurantAvailabilityData with _$RestaurantAvailabilityData {
  const factory RestaurantAvailabilityData({
    @JsonKey(name: 'is_open_now') required bool isNowOpen,
  }) = _RestaurantAvailabilityData;

  factory RestaurantAvailabilityData.fromJson(Map<String, Object?> json) => _$RestaurantAvailabilityDataFromJson(json);
}

@freezed
class RestaurantLocationData with _$RestaurantLocationData {
  const factory RestaurantLocationData({
    @JsonKey(name: 'formatted_address') required String address,
  }) = _RestaurantLocationData;

  factory RestaurantLocationData.fromJson(Map<String, Object?> json) => _$RestaurantLocationDataFromJson(json);
}
