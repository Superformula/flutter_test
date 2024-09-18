import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class MockRestaurantGqlClient extends Mock implements RestaurantGqlClient {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late RestaurantRepository repository;
  late MockRestaurantGqlClient mockGqlClient;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockGqlClient = MockRestaurantGqlClient();
    mockSharedPreferences = MockSharedPreferences();
    repository = RestaurantRepository(mockGqlClient, mockSharedPreferences);
  });

  group('RestaurantRepository', () {
    const restaurant = Restaurant(
      id: '1',
      name: 'Test Restaurant',
      price: r'$$',
      rating: 4.5,
      photos: ['http://image.com'],
    );

    group('isFavorite', () {
      test('returns true when restaurant is a favorite', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn(
          [jsonEncode(restaurant.toJson())],
        );

        final result = await repository.isFavorite(restaurant.id!);

        expect(result, isTrue);
        verify(() => mockSharedPreferences.getStringList(any())).called(1);
      });

      test('returns false when restaurant is not a favorite', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn(
          [],
        );

        final result = await repository.isFavorite(restaurant.id!);

        expect(result, isFalse);
        verify(() => mockSharedPreferences.getStringList(any())).called(1);
      });

      test('throws FetchRestaurantsException on error', () async {
        when(() => mockSharedPreferences.getStringList(any()))
            .thenThrow(Exception('SharedPreferences error'));

        expect(
          () async => repository.isFavorite(restaurant.id!),
          throwsA(isA<FetchRestaurantsException>()),
        );
      });
    });

    group('saveFavoriteRestaurant', () {
      test('saves a favorite restaurant successfully', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn([]);
        when(() => mockSharedPreferences.setStringList(any(), any()))
            .thenAnswer((_) async => true);

        await repository.saveFavoriteRestaurant(restaurant);

        verify(() => mockSharedPreferences.getStringList(any())).called(1);
        verify(() => mockSharedPreferences.setStringList(any(), any()))
            .called(1);
      });

      test('throws SaveFavoriteRestaurantException on error', () async {
        when(() => mockSharedPreferences.getStringList(any()))
            .thenThrow(Exception('SharedPreferences error'));

        expect(
          () async => repository.saveFavoriteRestaurant(restaurant),
          throwsA(isA<SaveFavoriteRestaurantException>()),
        );
      });
    });

    group('deleteFavoriteRestaurant', () {
      test('deletes a favorite restaurant successfully', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn(
          [jsonEncode(restaurant.toJson())],
        );
        when(() => mockSharedPreferences.setStringList(any(), any()))
            .thenAnswer((_) async => true);

        await repository.deleteFavoriteRestaurant(restaurant);

        verify(() => mockSharedPreferences.getStringList(any())).called(1);
        verify(() => mockSharedPreferences.setStringList(any(), any()))
            .called(1);
      });

      test('throws DeleteFavoriteRestaurantException on error', () async {
        when(() => mockSharedPreferences.getStringList(any()))
            .thenThrow(Exception('SharedPreferences error'));

        expect(
          () async => repository.deleteFavoriteRestaurant(restaurant),
          throwsA(isA<DeleteFavoriteRestaurantException>()),
        );
      });
    });

    group('fetchFavoriteRestaurants', () {
      test('fetches favorite restaurants successfully', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn(
          [jsonEncode(restaurant.toJson())],
        );

        final result = await repository.fetchFavoriteRestaurants();

        expect(jsonEncode(result), jsonEncode([restaurant]));
        verify(() => mockSharedPreferences.getStringList(any())).called(1);
      });

      test('returns empty list when no favorites found', () async {
        when(() => mockSharedPreferences.getStringList(any())).thenReturn([]);

        final result = await repository.fetchFavoriteRestaurants();

        expect(result, isEmpty);
        verify(() => mockSharedPreferences.getStringList(any())).called(1);
      });

      test('throws FetchRestaurantsException on error', () async {
        when(() => mockSharedPreferences.getStringList(any()))
            .thenThrow(Exception('SharedPreferences error'));

        expect(
          () async => repository.fetchFavoriteRestaurants(),
          throwsA(isA<FetchRestaurantsException>()),
        );
      });
    });

    group('fetchRestaurants', () {
      test('fetches restaurants successfully from GQL client', () async {
        const mockQueryResult = RestaurantQueryResult(
          total: 1,
          restaurants: [restaurant],
        );
        when(() => mockGqlClient.getRestaurants())
            .thenAnswer((_) async => mockQueryResult);

        final result = await repository.fetchRestaurants();

        expect(result, mockQueryResult);
        verify(() => mockGqlClient.getRestaurants()).called(1);
      });

      test('throws FetchRestaurantsException on GQL error', () async {
        when(() => mockGqlClient.getRestaurants())
            .thenThrow(Exception('GQL error'));

        expect(
          () async => repository.fetchRestaurants(),
          throwsA(isA<FetchRestaurantsException>()),
        );
      });
    });
  });
}
