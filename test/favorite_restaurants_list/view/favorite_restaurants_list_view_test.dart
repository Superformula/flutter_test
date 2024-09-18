import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';
import 'package:restaurant_tour/favorite_restaurants_list/view/favorite_restaurants_list_view.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class MockFavoriteRestaurantsBloc
    extends MockBloc<FavoriteRestaurantsEvent, FavoriteRestaurantsState>
    implements FavoriteRestaurantsBloc {}

class MockRestaurant extends Mock implements Restaurant {}

void main() {
  late FavoriteRestaurantsBloc favoriteRestaurantsBloc;

  setUp(() {
    favoriteRestaurantsBloc = MockFavoriteRestaurantsBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<FavoriteRestaurantsBloc>.value(
        value: favoriteRestaurantsBloc,
        child: const FavoriteRestaurantsListView(),
      ),
    );
  }

  group('FavoriteRestaurantsListView', () {
    testWidgets(
        'displays CircularProgressIndicator when state is FavoriteRestaurantsLoading',
        (tester) async {
      when(() => favoriteRestaurantsBloc.state)
          .thenReturn(const FavoriteRestaurantsLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error text when state is FavoriteRestaurantsError',
        (tester) async {
      when(() => favoriteRestaurantsBloc.state).thenReturn(
        const FavoriteRestaurantsError(message: 'An error occurred'),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('error'), findsOneWidget);
    });

    testWidgets(
        'displays a list of restaurants when state is FavoriteRestaurantsData',
        (tester) async {
      final mockRestaurants = [
        MockRestaurant(),
        MockRestaurant(),
      ];

      when(() => favoriteRestaurantsBloc.state)
          .thenReturn(FavoriteRestaurantsData(restaurants: mockRestaurants));

      when(() => mockRestaurants[0].id).thenReturn('1');
      when(() => mockRestaurants[0].name).thenReturn('Restaurant 1');
      when(() => mockRestaurants[0].heroImage)
          .thenReturn('http://example.com/restaurant1.jpg');
      when(() => mockRestaurants[0].isOpen).thenReturn(true);
      when(() => mockRestaurants[0].price).thenReturn(r'$$');
      when(() => mockRestaurants[0].rating).thenReturn(4.5);
      when(() => mockRestaurants[0].displayCategory).thenReturn('Category 1');

      when(() => mockRestaurants[1].id).thenReturn('2');
      when(() => mockRestaurants[1].name).thenReturn('Restaurant 2');
      when(() => mockRestaurants[1].heroImage)
          .thenReturn('http://example.com/restaurant2.jpg');
      when(() => mockRestaurants[1].isOpen).thenReturn(false);
      when(() => mockRestaurants[1].price).thenReturn(r'$$$');
      when(() => mockRestaurants[1].rating).thenReturn(3.8);
      when(() => mockRestaurants[1].displayCategory).thenReturn('Category 2');

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RestaurantCard), findsNWidgets(2));

      expect(find.text('Restaurant 1'), findsOneWidget);
      expect(find.text('Restaurant 2'), findsOneWidget);
      expect(find.text(r'$$ Category 1'), findsOneWidget);
      expect(find.text(r'$$$ Category 2'), findsOneWidget);
    });
  });
}
