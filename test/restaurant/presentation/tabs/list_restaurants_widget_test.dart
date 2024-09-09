import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/core/utils/app_keys.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_favorites.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/mark_favorite.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/pages/home_page.dart';
import 'package:restaurant_tour/features/restaurant/presentation/tabs/list_restaurants_widget.dart';

import '../../../fixtures/fixture.dart';

class MockGetRestaurants extends Mock implements GetRestaurants {}

class MockGetFavorites extends Mock implements GetFavorites {}

class MockMarkFavorite extends Mock implements MarkFavorite {}

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

  testWidgets("Should show a list of restaurants when fetch runs succesfully",
      (tester) async {
    // Arrange
    final result = jsonDecode(fixture("response.json"));
    final response = result["data"];
    final List<Restaurant> restaurants = [];
    for (final r in response["search"]["business"]) {
      restaurants.add(Restaurant.fromJson(r));
    }
    when(() => usecase()).thenAnswer((_) async => Right(restaurants));
    when(() => getFavorites()).thenAnswer((_) async => const Right([]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: ListRestaurants(restaurants: restaurants),
        ),
      ),
    );

    // Act
    cubit.getRestaurants();
    await tester.pump();

    // Assert
    expect(
      find.byKey(const Key(AppKeys.listRestaurantsFetched)),
      findsOneWidget,
    );
  });

  testWidgets("should show a text message stating that the list is empty",
      (tester) async {
    // Arrange
    when(() => usecase()).thenAnswer((_) async => const Right([]));
    when(() => getFavorites()).thenAnswer((_) async => const Right([]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const HomePage(),
        ),
      ),
    );

    // Act
    cubit.getRestaurants();
    await tester.pump();

    // Assert
    expect(
      find.byKey(const Key(AppKeys.restaurantListIsEmpty)),
      findsOneWidget,
    );
  });

  testWidgets(
      "should show a text message stating that the request returns "
      "with error", (tester) async {
    // Arrange
    when(() => usecase())
        .thenAnswer((_) async => Left(AppFailure(message: "Error")));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const HomePage(),
        ),
      ),
    );

    // Act
    cubit.getRestaurants();
    await tester.pump();

    // Assert
    expect(
      find.byKey(const Key(AppKeys.listRestaurantsError)),
      findsOneWidget,
    );
  });
}
