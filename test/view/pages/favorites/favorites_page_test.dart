import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';
import 'package:restaurant_tour/view/pages/favorites/favorites_page.dart';
import 'package:restaurant_tour/view/widgets/restaurant_card_widget.dart';

class MockFavoriteCubit extends MockCubit<FavoriteState>
    implements FavoriteCubit {}

late FavoriteCubit favoriteCubit;

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    () => HttpOverrides.global = null;
    favoriteCubit = MockFavoriteCubit();
  });

  tearDown(
    () {
      favoriteCubit.close();
    },
  );

  testWidgets('Find one favorited restaurant', (tester) async {
    when(() => favoriteCubit.state).thenReturn(
      FavoriteState(
        status: FavoriteStatus.success,
        favorites: [_restaurant],
      ),
    );

    await mockNetworkImages(() async => _createWidget(tester, [_restaurant]));

    await tester.pumpAndSettle();

    expect(find.byType(RestaurantCardWidget), findsOneWidget);
  });

  testWidgets('Find two favorited restaurant', (tester) async {
    when(() => favoriteCubit.state).thenReturn(
      FavoriteState(
        status: FavoriteStatus.success,
        favorites: _restaurantList,
      ),
    );

    await mockNetworkImages(() async => _createWidget(tester, _restaurantList));

    await tester.pumpAndSettle();

    expect(find.byType(RestaurantCardWidget), findsNWidgets(2));
  });
}

Future<void> _createWidget(
  WidgetTester tester,
  List<Restaurant> restaurants,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: BlocProvider.value(
          value: favoriteCubit,
          child: FavoritesListBuilder(
            restaurants: restaurants,
          ),
        ),
      ),
    ),
  );
}

Restaurant _restaurant = const Restaurant(id: '1', name: 'Pollos hermanos');
List<Restaurant> _restaurantList = [
  const Restaurant(id: '1', name: 'Pollos hermanos'),
  const Restaurant(id: '2', name: 'Pizza Planet'),
];
