import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';

part 'restaurant_dto.g.dart';

@JsonSerializable()
class RestaurantDto {
  final int? total;
  @JsonKey(name: 'business')
  final List<Restaurant>? restaurants;

  const RestaurantDto({
    this.total,
    this.restaurants,
  });

  factory RestaurantDto.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDtoToJson(this);
}
