import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/main.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/usecases/fetch_restaurants.dart';

class MockFetchRestaurants extends Mock implements FetchRestaurants {}

class MockYelpRepository extends Mock implements YelpRepository {}

void main() {
  late FetchRestaurants mockFetchRestaurants;
  late RestaurantCubit restaurantCubit;

  setUp(() {
    final getIt = GetIt.instance;
    getIt.reset();

    mockFetchRestaurants = MockFetchRestaurants();
    restaurantCubit = RestaurantCubit(mockFetchRestaurants);

    getIt.registerSingleton<RestaurantCubit>(restaurantCubit);
  });

  testWidgets(
      'displays loading state and then loaded state with "All restaurants"',
      (WidgetTester tester) async {
    when(() => mockFetchRestaurants.getRestaurantsFromCache()).thenAnswer(
      (_) async => YelpRepository().getRestaurantsFromCache(),
    ); // Add relevant data

    when(() => mockFetchRestaurants.getFavoriteRestaurants())
        .thenAnswer((_) async => []);

    // Pump the widget tree
    await tester.pumpWidget(const RestaurantTour());

    // Expect the loading state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Allow the state to change
    await tester.pump();

    // Expect the "All restaurants" text to be found after loading
    expect(find.text('RestauranTour'), findsOneWidget);
  });
}
