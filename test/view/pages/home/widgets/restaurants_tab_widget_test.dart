import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/view/cubit/restaurants/restaurants.dart';
import 'package:restaurant_tour/view/pages/home/widgets/restaurants_tab_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_card_widget.dart';

class MockRestaurantsCubit extends MockCubit<RestaurantsState>
    implements RestaurantsCubit {}

late RestaurantsCubit restaurantsCubit;

void main() {
  setUp(
    () {
      restaurantsCubit = MockRestaurantsCubit();
    },
  );

  tearDown(
    () {
      restaurantsCubit.close();
    },
  );

  testWidgets('Find restaurants inital state', (tester) async {
    when(() => restaurantsCubit.fetchRestaurants())
        .thenAnswer((_) => Future.value());

    when(() => restaurantsCubit.state)
        .thenReturn(RestaurantsState(status: RestaurantsStatus.initial));

    await _createWidget(tester);

    expect(find.byKey(const Key('initial state')), findsOneWidget);
  });

  testWidgets('Find restaurants loading state', (tester) async {
    when(() => restaurantsCubit.fetchRestaurants())
        .thenAnswer((_) => Future.value());

    when(() => restaurantsCubit.state)
        .thenReturn(RestaurantsState(status: RestaurantsStatus.loading));

    await _createWidget(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Find restaurants success state', (tester) async {
    when(() => restaurantsCubit.fetchRestaurants())
        .thenAnswer((_) => Future.value());

    when(() => restaurantsCubit.state).thenReturn(
      RestaurantsState(
        status: RestaurantsStatus.success,
        restaurants: [const Restaurant(id: '1', name: 'POllos hermanos')],
      ),
    );

    await mockNetworkImages(() async => _createWidget(tester));

    expect(find.byType(RestaurantCardWidget), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: BlocProvider.value(
          value: restaurantsCubit,
          child: const RestaurantsTabWidget(),
        ),
      ),
    ),
  );
}
