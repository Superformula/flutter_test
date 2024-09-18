import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';
import 'package:restaurant_tour/domain/usecases/usecases.dart';
import 'package:restaurant_tour/presentation/presentation.dart';

import '../../core/factories.dart';

class SpyGetRestaurants extends Mock implements GetRestaurants {}

class SpyGetFavoriteRestaurants extends Mock implements GetFavoriteRestaurants {}

class SpySaveFavoriteRestaurants extends Mock implements SaveFavoriteRestaurants {}

class FakeArticleEntity extends Fake implements RestaurantEntity {}

class FakefavoriteRestaurantEntity extends Fake implements FavoriteRestaurantEntity {}

void main() {
  late GetRestaurants getRestaurants;
  late GetFavoriteRestaurants getFavoriteRestaurants;
  late SaveFavoriteRestaurants saveFavoriteRestaurants;
  late CubitRestaurantTourPresenter sut;
  late List<RestaurantEntity> restaurants;
  late RestaurantEntity restaurantEntity;
  late List<FavoriteRestaurantEntity> favoriteRestaurants;

  When mockGetRestaurantsCall() {
    return when(() => getRestaurants());
  }

  void mockGetRestaurantsSuccess() {
    mockGetRestaurantsCall().thenAnswer((_) => Future.value(restaurants));
  }

  void mockGetRestaurantsError() {
    mockGetRestaurantsCall().thenThrow(DomainError.unexpected);
  }

  When mockGetFavoriteRestaurantsCall() {
    return when(() => getFavoriteRestaurants());
  }

  void mockGetFavoriteRestaurantsSuccess() {
    mockGetFavoriteRestaurantsCall().thenAnswer((_) => Future.value(favoriteRestaurants));
  }

  void mockGetFavoriteRestaurantsError() {
    mockGetFavoriteRestaurantsCall().thenThrow(DomainError.unexpected);
  }

  When mockSaveFavoriteRestaurantsCall() {
    return when(() => saveFavoriteRestaurants(any()));
  }

  void mockSaveFavoriteRestaurantsSuccess() {
    mockSaveFavoriteRestaurantsCall().thenAnswer((_) => Future.value());
  }

  void mockSaveFavoriteRestaurantsError() {
    mockSaveFavoriteRestaurantsCall().thenThrow(DomainError.unexpected);
  }

  void expectSuccessFlowEventsEmitted() {
    expectLater(
      sut.stream,
      emitsInOrder([isA<RestaurantLoadingState>(), isA<RestaurantSuccessState>()]),
    );
  }

  void expectErrorFlowEventsEmitted() {
    expectLater(
      sut.stream,
      emitsInOrder([isA<RestaurantLoadingState>(), isA<RestaurantErrorState>()]),
    );
  }

  void expectErrorEmitted() {
    expectLater(sut.stream, emits(isA<RestaurantErrorState>()));
  }

  setUp(() {
    getRestaurants = SpyGetRestaurants();
    getFavoriteRestaurants = SpyGetFavoriteRestaurants();
    saveFavoriteRestaurants = SpySaveFavoriteRestaurants();

    sut = CubitRestaurantTourPresenter(
      getRestaurants: getRestaurants,
      getFavoriteRestaurants: getFavoriteRestaurants,
      saveFavoriteRestaurants: saveFavoriteRestaurants,
    );

    restaurants = makeListRestaurantEntity();
    restaurantEntity = restaurants[0];
    favoriteRestaurants = makeListFavoriteRestaurantEntity();

    mockGetRestaurantsSuccess();
    mockGetFavoriteRestaurantsSuccess();
    mockSaveFavoriteRestaurantsSuccess();
  });

  setUpAll(() {
    registerFallbackValue(FakeArticleEntity());
    registerFallbackValue(FakefavoriteRestaurantEntity());
  });

  group('getAllRestaurants', () {
    test('Should emits [RestaurantLoadingState, RestaurantSuccessState] when getAllRestaurants was success', () async {
      expectSuccessFlowEventsEmitted();
      await sut.getAllRestaurants();
    });

    test('Should restaurantList is not empty when getAllRestaurants was success', () async {
      sut.restaurantList.clear();
      expect(sut.restaurantList.isEmpty, isTrue);
      await sut.getAllRestaurants();
      expect(sut.restaurantList.isNotEmpty, isTrue);
    });

    test('Should emits [RestaurantLoadingState, RestaurantErrorState] when getAllRestaurants fails', () async {
      mockGetRestaurantsError();
      expectErrorFlowEventsEmitted();
      await sut.getAllRestaurants();
    });
  });

  group('getFavoriteRestaurants', () {
    test('Should emits [RestaurantLoadingState, RestaurantSuccessState] when getFavoriteRestaurants was success', () async {
      expectSuccessFlowEventsEmitted();
      await sut.getFavoriteRestaurants();
    });

    test('Should groupedFavoriteNews is not empty when getFavoriteRestaurants was success', () async {
      expect(sut.favoriteRestaurantList.isEmpty, isTrue);
      await sut.getFavoriteRestaurants();
      expect(sut.favoriteRestaurantList.isNotEmpty, isTrue);
    });

    test('Should emits [RestaurantLoadingState, RestaurantErrorState] when getFavoriteRestaurants fails', () async {
      mockGetFavoriteRestaurantsError();
      expectErrorFlowEventsEmitted();
      await sut.getFavoriteRestaurants();
    });
  });

  group('addFavoriteRestaurant', () {
    setUp(() {
      sut.getAllRestaurants();
    });

    test('Should restaurantList have restaurant added as favorite when addFavoriteRestaurant was success', () async {
      await sut.addFavoriteRestaurant(restaurantEntity);
      final result = sut.restaurantList.firstWhere((item) => item.id == restaurantEntity.id);
      expect(result, isA<FavoriteRestaurantEntity>());
    });

    test('Should emits [RestaurantErrorState] when addFavoriteRestaurant fails', () async {
      mockSaveFavoriteRestaurantsError();
      expectErrorEmitted();
      await sut.addFavoriteRestaurant(restaurantEntity);
    });
  });
}
