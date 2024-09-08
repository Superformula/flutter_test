// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDataQueryImpl _$$RestaurantDataQueryImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDataQueryImpl(
      total: (json['total'] as num).toInt(),
      restaurants: (json['business'] as List<dynamic>)
          .map((e) => RestaurantData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RestaurantDataQueryImplToJson(
        _$RestaurantDataQueryImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'business': instance.restaurants,
    };

_$RestaurantDataImpl _$$RestaurantDataImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => RestaurantReviewData.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map(
              (e) => RestaurantCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: (json['location'] as List<dynamic>)
          .map(
              (e) => RestaurantLocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      hours: (json['hours'] as List<dynamic>)
          .map((e) =>
              RestaurantAvailabilityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] ?? false,
    );

Map<String, dynamic> _$$RestaurantDataImplToJson(
        _$RestaurantDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
      'photos': instance.photos,
      'reviews': instance.reviews,
      'categories': instance.categories,
      'location': instance.location,
      'hours': instance.hours,
      'isFavorite': instance.isFavorite,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

_$RestaurantReviewDataImpl _$$RestaurantReviewDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantReviewDataImpl(
      id: json['id'] as String,
      rating: (json['rating'] as num).toDouble(),
      text: json['text'] as String,
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantReviewDataImplToJson(
        _$RestaurantReviewDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'text': instance.text,
      'user': instance.user,
    };

_$RestaurantCategoryDataImpl _$$RestaurantCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantCategoryDataImpl(
      title: json['title'] as String,
      alias: json['alias'] as String,
    );

Map<String, dynamic> _$$RestaurantCategoryDataImplToJson(
        _$RestaurantCategoryDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'alias': instance.alias,
    };

_$RestaurantAvailabilityDataImpl _$$RestaurantAvailabilityDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantAvailabilityDataImpl(
      isNowOpen: json['is_open_now'] as bool,
    );

Map<String, dynamic> _$$RestaurantAvailabilityDataImplToJson(
        _$RestaurantAvailabilityDataImpl instance) =>
    <String, dynamic>{
      'is_open_now': instance.isNowOpen,
    };

_$RestaurantLocationDataImpl _$$RestaurantLocationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantLocationDataImpl(
      address: json['formatted_address'] as String,
    );

Map<String, dynamic> _$$RestaurantLocationDataImplToJson(
        _$RestaurantLocationDataImpl instance) =>
    <String, dynamic>{
      'formatted_address': instance.address,
    };
