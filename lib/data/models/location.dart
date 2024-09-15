import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/domain/models/location.dart'
    as location_domain_model;

part 'location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;

  Location({
    this.formattedAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  location_domain_model.Location toDomain() => location_domain_model.Location(
        formattedAddress: formattedAddress,
      );

  factory Location.fromDomain(location_domain_model.Location domain) =>
      Location(
        formattedAddress: domain.formattedAddress,
      );
}
