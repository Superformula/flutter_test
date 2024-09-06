import 'package:bloc_test/bloc_test.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import 'package:restaurant/presentation/presenters/all_restaurants_tab_presenter.dart';
import 'package:restaurant/domain/usecases/get_restaurants_usecase.dart';
import 'package:state_management/presentation/sf_state.dart';
import 'package:restaurant/domain/models/restaurant.dart';

import '../../mocks/server_responses.dart';

class MockGetRestaurantsUsecase extends Mock implements GetRestaurantsUsecase {}

void main() {
  late MockGetRestaurantsUsecase mockGetRestaurantsUsecase;

  setUpAll(() {
    mockGetRestaurantsUsecase = MockGetRestaurantsUsecase();

    SFInjector.instance.registerFactory<GetRestaurantsUsecase>(
        () => mockGetRestaurantsUsecase);
  });

  group('AllRestaurantsTabPresenter Tests', () {
    blocTest<AllRestaurantsTabPresenter, SFState>(
      'emits [SFLoadingState, SFSuccessState] when loadRestaurants is successful',
      setUp: () {
        var restaurants = Restaurant.fromJson(mockedRestaurant());
        when(() => mockGetRestaurantsUsecase.execute()).thenAnswer(
          (_) async => Right(
            RestaurantQueryResult(
              total: 1,
              restaurants: [restaurants],
            ),
          ),
        );
      },
      build: () => AllRestaurantsTabPresenter(),
      act: (presenter) => presenter.loadRestaurants(),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFSuccessState<RestaurantQueryResult>>(),
      ],
    );

    blocTest<AllRestaurantsTabPresenter, SFState>(
      'emits [SFLoadingState, SFErrorState] when loadRestaurants fails',
      setUp: () {
        when(() => mockGetRestaurantsUsecase.execute()).thenAnswer(
            (_) async => Left(GetRestaurantError(error: "Generic Error")));
      },
      build: () => AllRestaurantsTabPresenter(),
      act: (presenter) => presenter.loadRestaurants(),
      expect: () => [
        isA<SFLoadingState>(),
        isA<SFErrorState>(),
      ],
    );
  });
}
