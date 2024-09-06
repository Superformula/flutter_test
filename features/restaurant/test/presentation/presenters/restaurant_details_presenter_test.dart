import 'package:bloc_test/bloc_test.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/usecases/favorite/add_to_favorite_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/check_restaurant_favorited_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/remove_from_favorite_usecase.dart';
import 'package:restaurant/presentation/presenters/restaurant_details_presenter.dart';
import 'package:state_management/presentation/sf_state.dart';

import '../../mocks/server_responses.dart';

class MockAddToFavoriteUseCase extends Mock implements AddToFavoriteUseCase {}

class MockRemoveFromFavoriteUseCase extends Mock
    implements RemoveFromFavoriteUseCase {}

class MockCheckRestaurantFavoritedUseCase extends Mock
    implements CheckRestaurantFavoritedUseCase {}

void main() {
  late MockAddToFavoriteUseCase mockAddToFavoriteUseCase;
  late MockRemoveFromFavoriteUseCase mockRemoveFromFavoriteUseCase;
  late MockCheckRestaurantFavoritedUseCase mockCheckRestaurantFavoritedUseCase;
  late Restaurant restaurant;

  setUpAll(() {
    mockAddToFavoriteUseCase = MockAddToFavoriteUseCase();
    mockRemoveFromFavoriteUseCase = MockRemoveFromFavoriteUseCase();
    mockCheckRestaurantFavoritedUseCase = MockCheckRestaurantFavoritedUseCase();
    SFInjector.instance
        .registerFactory<AddToFavoriteUseCase>(() => mockAddToFavoriteUseCase);
    SFInjector.instance.registerFactory<RemoveFromFavoriteUseCase>(
        () => mockRemoveFromFavoriteUseCase);
    SFInjector.instance.registerFactory<CheckRestaurantFavoritedUseCase>(
        () => mockCheckRestaurantFavoritedUseCase);
  });

  group('RestaurantDetailsPresenter Tests', () {
    blocTest<RestaurantDetailsPresenter, SFState>(
      'emits [SFLoadingState, SFSuccessState] when checking if restaurant is favorited',
      setUp: () {
        restaurant = Restaurant.fromJson(mockedRestaurant());
        when(() => mockCheckRestaurantFavoritedUseCase.isFavorited(restaurant))
            .thenAnswer((_) async => true);
      },
      build: () => RestaurantDetailsPresenter(restaurant.isFavorite),
      act: (presenter) => presenter.isRestaurantFavorite(restaurant),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFSuccessState<bool>>()
            .having((state) => state.object, 'isFavorited', true),
      ],
    );

    blocTest<RestaurantDetailsPresenter, SFState>(
      'emits [SFLoadingState, SFSuccessState] when favoriting a restaurant',
      setUp: () {
        restaurant = Restaurant.fromJson(mockedRestaurant());
        when(() => mockAddToFavoriteUseCase.favorite(restaurant))
            .thenAnswer((_) async {});
      },
      build: () => RestaurantDetailsPresenter(restaurant.isFavorite),
      seed: () => SFSuccessState(object: false),
      act: (presenter) => presenter.heartPressed(restaurant),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFSuccessState<bool>>()
            .having((state) => state.object, 'isFavorite', true),
      ],
      verify: (bloc) {
        expect(restaurant.isFavorite, true);
      },
    );

    blocTest<RestaurantDetailsPresenter, SFState>(
      'emits [SFLoadingState, SFSuccessState] when unfavoriting a restaurant',
      setUp: () {
        restaurant = Restaurant.fromJson(mockedRestaurant());
        when(() => mockRemoveFromFavoriteUseCase.remove(restaurant))
            .thenAnswer((_) async {});
        restaurant.isFavorite = true;
      },
      build: () => RestaurantDetailsPresenter(restaurant.isFavorite),
      seed: () => SFSuccessState(object: true),
      act: (presenter) => presenter.heartPressed(restaurant),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFSuccessState<bool>>()
            .having((state) => state.object, 'isFavorite', false),
      ],
      verify: (bloc) {
        expect(restaurant.isFavorite, false);
      },
    );
  });
}
