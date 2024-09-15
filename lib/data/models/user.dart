import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/domain/models/user.dart' as review_domain_model;

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final String? name;

  const User({
    this.id,
    this.imageUrl,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  review_domain_model.User toDomain() => review_domain_model.User(
        id: id,
        imageUrl: imageUrl,
        name: name,
      );

  factory User.fromDomain(review_domain_model.User domain) => User(
        id: domain.id,
        imageUrl: domain.imageUrl,
        name: domain.name,
      );
}
