import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/usecases/usecases.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';
import 'package:restaurant_tour/infra/infra.dart';

import '../../core/factories.dart';

class SaveCacheSpy extends Mock implements SaveCache {}

void main() {
  late SaveCacheSpy saveCache;
  late LocalSaveFavoriteRestaurants sut;
  late List<RestaurantEntity> restaurantList;

  When mockSaveCall() {
    return when(() => saveCache.save(key: any(named: 'key'), value: any(named: 'value')));
  }

  void mockSave() {
    mockSaveCall().thenAnswer((_) async => faker.randomGenerator.integer(10));
  }

  void mockSaveError() {
    mockSaveCall().thenThrow(Exception());
  }

  setUp(() {
    saveCache = SaveCacheSpy();
    sut = LocalSaveFavoriteRestaurants(cache: saveCache);
    restaurantList = makeListRestaurantEntity();
    mockSave();
  });

  test('Should call SaveCache with correct value', () async {
    await sut(restaurantList);
    verify(() => saveCache.save(key: any(named: 'key'), value: any(named: 'value')));
  });

  test('Should throw UnexpectedError if saveCache throws', () async {
    mockSaveError();
    final future = sut(restaurantList);
    expect(future, throwsA(DomainError.unexpected));
  });
}
