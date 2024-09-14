import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class CategoryModel {
  final String title;
  final String alias;

  CategoryModel({
    required this.title,
    required this.alias,
  });

  factory CategoryModel.fromEntity(CategoryEntity category) {
    return CategoryModel(
      title: category.title,
      alias: category.alias,
    );
  }

  factory CategoryModel.fromJson(Map json) {
    try {
      return CategoryModel(
        title: json['title'],
        alias: json['alias'],
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      title: title,
      alias: alias,
    );
  }
}
