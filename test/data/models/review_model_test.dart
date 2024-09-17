import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/models/models.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';

import '../../core/factories.dart';

void main() {
  late Map reviewJson;
  late ReviewModel reviewModel;
  late ReviewEntity reviewEntity;

  setUp(() {
    reviewJson = makeReviewJson();
    reviewModel = makeReviewModel();
    reviewEntity = makeReviewEntity();
  });

  test('Should create ReviewModel object when json is valid', () async {
    final json = ReviewModel.fromJson(reviewJson);
    expect(json, isA<ReviewModel>());
  });

  test('Should create ReviewEntity object from ReviewModel object', () async {
    final json = ReviewModel.fromEntity(reviewEntity);
    expect(json, isA<ReviewModel>());
  });

  test('Should throw a unexpected error when json is not valid', () async {
    expect(() => ReviewModel.fromJson(makeInvalidJson()), throwsA(DomainError.unexpected));
  });

  test('Should create a ReviewEntity object', () async {
    final result = reviewModel.toEntity();
    expect(result, isA<ReviewEntity>());
  });
}
