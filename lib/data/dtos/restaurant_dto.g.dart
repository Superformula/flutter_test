// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDto _$RestaurantDtoFromJson(Map<String, dynamic> json) =>
    RestaurantDto(
      total: (json['total'] as num?)?.toInt(),
      restaurants: (json['business'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantDtoToJson(RestaurantDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'business': instance.restaurants?.map((e) => e.toJson()).toList(),
    };
