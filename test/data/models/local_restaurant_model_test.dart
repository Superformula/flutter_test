import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/models/models.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';

import '../../core/factories.dart';

void main() {
  late Map restaurantJson;
  late LocalRestaurantModel localRestaurantModel;
  late RestaurantEntity restaurantEntity;

  setUp(() {
    restaurantJson = makeLocalRestaurantsJson().first;
    localRestaurantModel = makeLocalRestaurantModel();
    restaurantEntity = makeRestaurantEntity();
  });

  test('Should create LocalRestaurantModel object when json is valid', () async {
    final json = LocalRestaurantModel.fromJson(restaurantJson);
    expect(json, isA<LocalRestaurantModel>());
  });

  test('Should create RestaurantEntity object from LocalRestaurantModel object', () async {
    final json = LocalRestaurantModel.fromEntity(restaurantEntity);
    expect(json, isA<LocalRestaurantModel>());
  });

  test('Should throw a unexpected error when json is not valid', () async {
    expect(() => LocalRestaurantModel.fromJson(makeInvalidJson()), throwsA(DomainError.unexpected));
  });

  test('Should create a FavoriteRestaurantEntity object', () async {
    final result = localRestaurantModel.toEntity();
    expect(result, isA<FavoriteRestaurantEntity>());
  });
}
