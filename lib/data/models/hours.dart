import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/domain/models/hours.dart' as hours_domain_model;

part 'hours.g.dart';

@JsonSerializable()
class Hours {
  @JsonKey(name: 'is_open_now')
  final bool? isOpenNow;

  const Hours({
    this.isOpenNow,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);

  hours_domain_model.Hours toDomain() => hours_domain_model.Hours(
        isOpenNow: isOpenNow,
      );
}
