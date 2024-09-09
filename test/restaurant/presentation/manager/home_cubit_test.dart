import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_favorites.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/mark_favorite.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_state.dart';

class MockGetRestaurants extends Mock implements GetRestaurants {}

class MockGetFavorites extends Mock implements GetFavorites {}

class MockMarkFavorite extends Mock implements MarkFavorite {}

class MockRestaurant extends Mock implements Restaurant {}

void main() {
  late MockGetRestaurants usecase;
  late MockGetFavorites getFavorites;
  late MockMarkFavorite markFavorite;
  late HomeCubit cubit;

  setUpAll(() {
    usecase = MockGetRestaurants();
    getFavorites = MockGetFavorites();
    markFavorite = MockMarkFavorite();
    cubit = HomeCubit(
      usecase,
      markFavorite,
      getFavorites,
    );
  });

  group("getRestaurants |", () {
    test(
        "Should return a HomeError state when the app can't retry the "
        "restaurant list", () async {
      // Arrange
      when(() => usecase()).thenAnswer((_) async => Left(AppFailure()));

      //Assert
      expect(
        cubit.stream,
        emitsInOrder(
          [
            isA<HomeLoading>(),
            isA<HomeError>(),
          ],
        ),
      );

      // Act
      await cubit.getRestaurants();
    });

    test(
        "Should return a HomeLoaded with a list of Restaurants when the "
        "request occurs with success and has restaurants", () async {
      // Arrange
      final List<Restaurant> restaurantList = List.filled(20, MockRestaurant());
      when(() => usecase()).thenAnswer((_) async => Right(restaurantList));

      // Assert
      expect(
        cubit.stream,
        emitsInOrder(
          [
            isA<HomeLoading>(),
            isA<HomeLoaded>(),
          ],
        ),
      );

      // Act
      await cubit.getRestaurants();
    });
  });
}
