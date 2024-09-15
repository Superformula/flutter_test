import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/data/models/user.dart';
import 'package:restaurant_tour/domain/models/review.dart'
    as review_domain_model;

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String? id;
  final int? rating;
  final String? text;
  final User? user;

  const Review({
    this.id,
    this.rating,
    this.user,
    this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  review_domain_model.Review toDomain() => review_domain_model.Review(
        id: id,
        rating: rating,
        text: text,
        user: user?.toDomain(),
      );

  factory Review.fromDomain(review_domain_model.Review domain) => Review(
        id: domain.id,
        rating: domain.rating,
        text: domain.text,
        user: domain.user != null ? User.fromDomain(domain.user!) : null,
      );
}
