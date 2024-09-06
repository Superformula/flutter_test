// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      alias: json['alias'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'alias': instance.alias,
      'title': instance.title,
    };

Hours _$HoursFromJson(Map<String, dynamic> json) => Hours(
      isOpenNow: json['is_open_now'] as bool?,
    );

Map<String, dynamic> _$HoursToJson(Hours instance) => <String, dynamic>{
      'is_open_now': instance.isOpenNow,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String,
      rating: (json['rating'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'text': instance.text,
      'user': instance.user,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      formattedAddress: json['formatted_address'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'formatted_address': instance.formattedAddress,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
      'photos': instance.photos,
      'categories': instance.categories,
      'hours': instance.hours,
      'reviews': instance.reviews,
      'location': instance.location,
      'isFavorite': instance.isFavorite,
    };

RestaurantQueryResult _$RestaurantQueryResultFromJson(
        Map<String, dynamic> json) =>
    RestaurantQueryResult(
      total: (json['total'] as num).toInt(),
      restaurants: (json['business'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantQueryResultToJson(
        RestaurantQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'business': instance.restaurants,
    };
