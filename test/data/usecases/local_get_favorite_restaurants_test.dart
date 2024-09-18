import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/usecases/usecases.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';
import 'package:restaurant_tour/infra/infra.dart';

import '../../core/factories.dart';

class FetchCacheSpy extends Mock implements FetchCache {}

void main() {
  late LocalGetFavoriteRestaurants sut;
  late FetchCacheSpy fetchCache;

  When mockFetchCall() => when(() => fetchCache.fetch(any()));

  void mockFetch() {
    mockFetchCall().thenAnswer((_) async => jsonEncode(makeLocalRestaurantsJson()));
  }

  void mockFetchError() {
    mockFetchCall().thenThrow(Exception());
  }

  setUp(() {
    fetchCache = FetchCacheSpy();
    sut = LocalGetFavoriteRestaurants(cache: fetchCache);
    mockFetch();
  });

  test('Should call fetchCache with correct value', () async {
    await sut();
    verify(() => fetchCache.fetch(any()));
  });

  test('Should return an List<FavoriteArticleEntity>', () async {
    final result = await sut();
    expect(result, isA<List<FavoriteRestaurantEntity>>());
  });

  test('Should throw UnexpectedError if fetchCache throws', () async {
    mockFetchError();
    final future = sut();
    expect(future, throwsA(DomainError.unexpected));
  });
}
