import 'dart:convert';
import 'package:cache/cache.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/repositories/favorites/cache_favorite_repository.dart';

import '../../mocks/server_responses.dart';

class MockSFCacheManager extends Mock implements SFCacheManager {}

void main() {
  late CacheFavoriteRepository cacheFavoriteRepository;
  late MockSFCacheManager mockCacheManager;

  final restaurant =
      Restaurant.fromJson(mockedRestaurant(name: 'Test Restaurant'));
  final secondRestaurant =
      Restaurant.fromJson(mockedRestaurant(name: 'Test Second Restaurant'));

  //  (
  //   id: '123',
  //   name: 'Test Restaurant',
  //   price: '\$\$',
  //   rating: 4.5,
  //   location: Location(formattedAddress: '123 Test St'),
  //   reviews: [],
  // );

  setUpAll(() {
    mockCacheManager = MockSFCacheManager();
    SFInjector.instance.registerFactory<SFCacheManager>(() => mockCacheManager);
    cacheFavoriteRepository = CacheFavoriteRepository();
  });

  group('CacheFavoriteRepository', () {
    test(
        'Given a restaurant favorited, when addNewFavoriteRestaurant is called with another one, then it should store them both',
        () async {
      final restaurantJson = jsonEncode({
        'restaurants': [restaurant.toJson()],
      });
      when(() => mockCacheManager.getString('favorites_restaurants'))
          .thenAnswer((_) async => restaurantJson);
      when(() => mockCacheManager.setString('favorites_restaurants', any()))
          .thenAnswer((invocation) => Future.value());

      final expectedJson = jsonEncode({
        'restaurants': [restaurant.toJson(), secondRestaurant.toJson()],
      });

      await cacheFavoriteRepository.addNewFavoriteRestaurant(secondRestaurant);

      verify(() =>
              mockCacheManager.setString('favorites_restaurants', expectedJson))
          .called(1);
    });
    test(
        'Given a restaurant, when addNewFavoriteRestaurant is called, then it should store the restaurant in cache',
        () async {
      when(() => mockCacheManager.getString('favorites_restaurants'))
          .thenAnswer((_) async => null);
      when(() => mockCacheManager.setString('favorites_restaurants', any()))
          .thenAnswer((invocation) => Future.value());
      final expectedJson = jsonEncode({
        'restaurants': [restaurant.toJson()],
      });

      await cacheFavoriteRepository.addNewFavoriteRestaurant(restaurant);

      verify(() =>
              mockCacheManager.setString('favorites_restaurants', expectedJson))
          .called(1);
    });

    test(
        'Given no stored restaurants, when getFavoriteRestaurants is called, then it should return an empty list',
        () async {
      when(() => mockCacheManager.getString('favorites_restaurants'))
          .thenAnswer((_) async => null);

      final result = await cacheFavoriteRepository.getFavoriteRestaurants();

      expect(result, []);
    });

    test(
        'Given stored restaurants, when getFavoriteRestaurants is called, then it should return a list of restaurants',
        () async {
      final restaurantJson = jsonEncode({
        'restaurants': [restaurant.toJson()],
      });
      when(() => mockCacheManager.getString('favorites_restaurants'))
          .thenAnswer((_) async => restaurantJson);

      final result = await cacheFavoriteRepository.getFavoriteRestaurants();

      expect(result.length, 1);
      expect(result.first.id, restaurant.id);
    });

    test(
        'Given a restaurant, when removeRestaurantFromFavorites is called, then it should remove the restaurant from cache',
        () async {
      when(() => mockCacheManager.setString('favorites_restaurants', any()))
          .thenAnswer((invocation) => Future.value());
      final restaurantJson = jsonEncode({
        'restaurants': [restaurant.toJson()],
      });
      when(() => mockCacheManager.getString('favorites_restaurants'))
          .thenAnswer((_) async => restaurantJson);

      await cacheFavoriteRepository.removeRestaurantFromFavorites(restaurant);

      final expectedJson = jsonEncode({'restaurants': []});
      verify(() =>
              mockCacheManager.setString('favorites_restaurants', expectedJson))
          .called(1);
    });
  });
}
