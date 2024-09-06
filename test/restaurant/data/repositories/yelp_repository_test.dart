import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/app_exceptions.dart';
import 'package:restaurant_tour/features/restaurant/data/data_sources/remote_datasource.dart';
import 'package:restaurant_tour/features/restaurant/data/repositories/yelp_repository_impl.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';

import '../../../fixtures/fixture.dart';

class MockRemoteDatasource extends Mock implements RemoteDatasource {}

void main() {
  late MockRemoteDatasource datasource;
  late YelpRepository repository;

  setUpAll(() {
    datasource = MockRemoteDatasource();
    repository = YelpRepositoryImpl(datasource: datasource);
  });

  group("getRestaurantsFromRepo |", () {
    test(
      "Should return Left(ServerFailure) when get error from datasource",
      () async {
        // Arrange
        when(() => datasource.getRestaurants()).thenThrow(ServerException());

        // Act
        final result = await repository.getRestaurantsFromRepo();

        // Assert
        verify(() => datasource.getRestaurants());
        expect(result.isLeft(), isTrue);
      },
    );

    test(
        "Should return a Right(List<Restaurant>()) when datasource return data correctly",
        () async {
      // Arrange
      when(() => datasource.getRestaurants())
          .thenAnswer((_) async => jsonDecode(fixture("response.json")));

      // Act
      final result = await repository.getRestaurantsFromRepo();

      // Assert
      verify(() => datasource.getRestaurants());
      expect(result.isRight(), isTrue);
    });
  });
}
