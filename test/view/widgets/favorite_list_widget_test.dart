import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/view/widgets/favorite_list_widget.dart';

class MockFavoritesRestaurantsBloc
    extends MockBloc<FavoritesRestaurantsEvent, FavoritesRestaurantsState>
    implements FavoritesRestaurantsBloc {}

void main() {
  testWidgets('FavoriteListWidget displays restaurants correctly',
      (WidgetTester tester) async {
    // Create mock bloc and state
    final mockBloc = MockFavoritesRestaurantsBloc();

    whenListen<FavoritesRestaurantsState>(
      mockBloc,
      Stream.fromIterable(
        [
          FavoritesRestaurantsLoading(),
          FavoritesRestaurantsReady(const [
            Restaurant(
              id: '1',
              name: 'Restaurant 1',
              rating: 4.5,
              photos: ['https://picsum.photos/200/300'],
            ),
            Restaurant(
              id: '2',
              name: 'Restaurant 2',
              rating: 4.2,
              photos: ['https://picsum.photos/200/300'],
            ),
          ]),
        ],
      ),
      initialState: FavoritesRestaurantsInitial(),
    );

    // Provide the mock bloc to GetIt
    GetIt.I.registerSingleton<FavoritesRestaurantsBloc>(mockBloc);

    // Pump the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FavoriteListWidget(),
        ),
      ),
    );
    expect(find.text('Restaurant 1'), findsNothing);
    expect(find.text('Restaurant 2'), findsNothing);
    await tester.pump();
    // Verify that the list contains the expected restaurants
    expect(find.text('Restaurant 1'), findsOneWidget);
    expect(find.text('Restaurant 2'), findsOneWidget);
  });
}
