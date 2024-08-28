// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      alias: json['alias'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'title': instance.title,
    };

_$HoursImpl _$$HoursImplFromJson(Map<String, dynamic> json) => _$HoursImpl(
      isOpenNow: json['is_open_now'] as bool,
    );

Map<String, dynamic> _$$HoursImplToJson(_$HoursImpl instance) =>
    <String, dynamic>{
      'is_open_now': instance.isOpenNow,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      rating: (json['rating'] as num).toInt(),
      text: json['text'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'text': instance.text,
      'user': instance.user,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      formattedAddress: json['formatted_address'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'formatted_address': instance.formattedAddress,
    };

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
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
    };

_$RestaurantQueryResultImpl _$$RestaurantQueryResultImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantQueryResultImpl(
      total: (json['total'] as num).toInt(),
      restaurants: (json['business'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RestaurantQueryResultImplToJson(
        _$RestaurantQueryResultImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'business': instance.restaurants,
    };
