import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';
import 'package:restaurant_tour/view/cubit/restaurants/restaurants.dart';

class MockYelpRepository extends Mock implements YelpRepository {}

void main() {
  late RestaurantsCubit restaurantsCubit;
  late YelpRepository repository;

  setUp(() {
    repository = MockYelpRepository();
    restaurantsCubit = RestaurantsCubit(repository);
  });

  tearDown(() {
    restaurantsCubit.close();
  });

  blocTest<RestaurantsCubit, RestaurantsState>(
    'Should emit a RestaurantsStatus.success when '
    'api returns a list of restaurants',
    build: () => restaurantsCubit,
    act: (cubit) async {
      when(() => repository.getRestaurants()).thenAnswer(
        (_) async => Future.value(
          const Some(
            RestaurantQueryResult(
              restaurants: [
                Restaurant(id: '2', name: 'Better call saul'),
              ],
            ),
          ),
        ),
      );

      await cubit.fetchRestaurants();
    },
    expect: () => [
      RestaurantsState(status: RestaurantsStatus.loading),
      RestaurantsState(
        status: RestaurantsStatus.success,
        restaurants: const [Restaurant(id: '2', name: 'Better call saul')],
      ),
    ],
  );

  group('Error tests', () {
    blocTest<RestaurantsCubit, RestaurantsState>(
      'Should emit a RestaurantsStatus.failure when'
      'api returns none',
      build: () => restaurantsCubit,
      act: (cubit) async {
        when(() => repository.getRestaurants()).thenAnswer(
          (_) async => Future.value(
            const None(),
          ),
        );

        await cubit.fetchRestaurants();
      },
      expect: () => [
        RestaurantsState(status: RestaurantsStatus.loading),
        RestaurantsState(
          status: RestaurantsStatus.failure,
          errorMessage: 'An unexpected error occurred',
        ),
      ],
    );

    blocTest<RestaurantsCubit, RestaurantsState>(
      'Should emit a RestaurantsStatus.failure when'
      'api returns an invalid list',
      build: () => restaurantsCubit,
      act: (cubit) async {
        when(() => repository.getRestaurants()).thenAnswer(
          (_) async => Future.value(
            const Some(
              RestaurantQueryResult(
                restaurants: null,
              ),
            ),
          ),
        );

        await cubit.fetchRestaurants();
      },
      expect: () => [
        RestaurantsState(status: RestaurantsStatus.loading),
        RestaurantsState(
          status: RestaurantsStatus.failure,
          errorMessage: 'Invalid restaurants',
        ),
      ],
    );
  });
}
