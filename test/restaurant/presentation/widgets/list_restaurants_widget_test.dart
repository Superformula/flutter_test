import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/app_keys.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/widgets/list_restaurants_widget.dart';

import '../../../fixtures/fixture.dart';

class MockGetRestaurants extends Mock implements GetRestaurants {}

void main() {
  late MockGetRestaurants usecase;
  late HomeCubit cubit;

  setUpAll(() {
    usecase = MockGetRestaurants();
    cubit = HomeCubit(usecase);
  });

  testWidgets(
    "Should show a CircularProgressIndicator when fetching data",
    (tester) async {
      // Arrange
      when(() => usecase()).thenAnswer((_) async => const Right([]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: cubit,
            child: const ListRestaurants(),
          ),
        ),
      );

      // Act
      cubit.getRestaurants();

      // Assert
      expect(
        find.byKey(const Key(AppKeys.loadingRestaurantsIndicator)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(AppKeys.listRestaurantsError)),
        findsNothing,
      );
    },
  );

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

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const ListRestaurants(),
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
}
