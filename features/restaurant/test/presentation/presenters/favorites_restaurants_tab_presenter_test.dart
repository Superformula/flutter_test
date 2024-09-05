import 'package:bloc_test/bloc_test.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import 'package:restaurant/domain/usecases/favorite/get_favorite_restaurants_usecase.dart';
import 'package:restaurant/presentation/presenters/favorites_restaurants_tab_presenter.dart';
import 'package:state_management/presentation/sf_state.dart';
import 'package:restaurant/domain/models/restaurant.dart';

import '../../mocks/server_responses.dart';

class MockGetFavoriteRestaurantsUsecase extends Mock
    implements GetFavoriteRestaurantsUsecase {}

void main() {
  late MockGetFavoriteRestaurantsUsecase mockGetRestaurantsUsecase;

  setUpAll(() {
    mockGetRestaurantsUsecase = MockGetFavoriteRestaurantsUsecase();

    SFInjector.instance.registerFactory<GetFavoriteRestaurantsUsecase>(
        () => mockGetRestaurantsUsecase);
  });

  group('FavoriteRestaurantsTabPresenter Tests', () {
    blocTest<FavoriteRestaurantsTabPresenter, SFState>(
      'emits [SFLoadingState, SFSuccessState] when loadRestaurants is successful',
      setUp: () {
        var restaurants = Restaurant.fromJson(mockedRestaurant());
        when(() => mockGetRestaurantsUsecase.execute()).thenAnswer(
          (_) async => Right([restaurants]),
        );
      },
      build: () => FavoriteRestaurantsTabPresenter(),
      act: (presenter) => presenter.loadRestaurants(),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFSuccessState<List<Restaurant>>>(),
      ],
    );

    blocTest<FavoriteRestaurantsTabPresenter, SFState>(
      'emits [SFLoadingState, SFErrorState] when loadRestaurants fails',
      setUp: () {
        when(() => mockGetRestaurantsUsecase.execute()).thenAnswer(
            (_) async => Left(GetRestaurantError(error: "Generic Error")));
      },
      build: () => FavoriteRestaurantsTabPresenter(),
      act: (presenter) => presenter.loadRestaurants(),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFErrorState>(),
      ],
    );
  });
}
