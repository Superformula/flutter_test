import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/cubit/restaurant_cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/usecases/fetch_restaurants.dart';

class MockFetchRestaurantsUseCase extends Mock implements FetchRestaurants {}

class MockRestaurantQueryResult extends Mock implements RestaurantQueryResult {}

void main() {
  late RestaurantCubit restaurantCubit;
  late MockFetchRestaurantsUseCase mockFetchRestaurantsUseCase;

  setUp(() {
    mockFetchRestaurantsUseCase = MockFetchRestaurantsUseCase();
    restaurantCubit = RestaurantCubit(mockFetchRestaurantsUseCase);
  });

  tearDown(() {
    restaurantCubit.close();
  });

  blocTest(
    'Emits Loading and Loaded states when fetchRestaurants is successful',
    build: () {
      final mockResult = MockRestaurantQueryResult();
      when(() => mockFetchRestaurantsUseCase.getRestaurants())
          .thenAnswer((_) async => mockResult);

      when(() => mockFetchRestaurantsUseCase.getFavoriteRestaurants())
          .thenAnswer((_) async => ['abc', 'def']);
      return restaurantCubit;
    },
    act: (cubit) => cubit.fetchRestaurants(),
    expect: () => [
      const LoadingRestaurantsState(favoriteRestaurants: []),
      isA<RestaurantsLoadedState>(),
    ],
    verify: (cubit) {
      verify(() => mockFetchRestaurantsUseCase.getRestaurants()).called(1);
      verify(() => mockFetchRestaurantsUseCase.getFavoriteRestaurants())
          .called(1);
    },
  );

  blocTest<RestaurantCubit, RestaurantState>(
    'emits [LoadingRestaurantsState, ErrorState] when fetchRestaurants fails',
    build: () {
      when(() => mockFetchRestaurantsUseCase.getRestaurants())
          .thenAnswer((_) async => null);
      when(() => mockFetchRestaurantsUseCase.getFavoriteRestaurants())
          .thenAnswer((_) async => []);
      return restaurantCubit;
    },
    act: (cubit) => cubit.fetchRestaurants(),
    expect: () => [
      const LoadingRestaurantsState(favoriteRestaurants: []),
      const ErrorState(
        message:
            'The server encountered a problem and we couldn\'t load the list.',
        favoriteRestaurants: [],
      ),
    ],
    verify: (cubit) {
      verify(() => mockFetchRestaurantsUseCase.getRestaurants()).called(1);
      verify(() => mockFetchRestaurantsUseCase.getFavoriteRestaurants())
          .called(1);
    },
  );

  blocTest<RestaurantCubit, RestaurantState>(
    'emits [FavoriteRestaurantState] when someone favorites or un-favorites a restaurant',
    build: () => restaurantCubit,
    setUp: () {
      restaurantCubit.emit(
        RestaurantsLoadedState(
          result: MockRestaurantQueryResult(),
          favoriteRestaurants: const ['1', '2'],
        ),
      );
    },
    act: (cubit) => cubit.favoriteAResturant('1'),
    expect: () => [
      FavoriteRestaurantState(
        result: MockRestaurantQueryResult(),
        favoriteRestaurants: List.of(['2']),
      ),
    ],
  );
}
