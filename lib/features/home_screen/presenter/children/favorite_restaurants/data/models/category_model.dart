import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required String title,
    required String alias,
  }) : super(
    title: title,
    alias: alias,
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'alias': alias,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] ?? '',
      alias: json['alias'] ?? '',
    );
  }
}