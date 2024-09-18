import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/models/models.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';

import '../../core/factories.dart';

void main() {
  late Map categoryJson;
  late CategoryModel categoryModel;
  late CategoryEntity categoryEntity;

  setUp(() {
    categoryJson = makeCategoryJson();
    categoryModel = makeCategoryModel();
    categoryEntity = makeCategoryEntity();
  });

  test('Should create CategoryModel object when json is valid', () async {
    final json = CategoryModel.fromJson(categoryJson);
    expect(json, isA<CategoryModel>());
  });

  test('Should create CategoryEntity object from CategoryModel object', () async {
    final json = CategoryModel.fromEntity(categoryEntity);
    expect(json, isA<CategoryModel>());
  });

  test('Should throw a unexpected error when json is not valid', () async {
    expect(() => CategoryModel.fromJson({'alias': 33}), throwsA(DomainError.unexpected));
  });

  test('Should create a CategoryEntity object', () async {
    final result = categoryModel.toEntity();
    expect(result, isA<CategoryEntity>());
  });
}
