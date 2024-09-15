import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_tour/domain/models/category.dart'
    as category_domain_model;

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String? alias;
  final String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  category_domain_model.Category toDomain() => category_domain_model.Category(
        alias: alias,
        title: title,
      );

  factory Category.fromDomain(category_domain_model.Category domain) =>
      Category(
        alias: domain.alias,
        title: domain.title,
      );
}
