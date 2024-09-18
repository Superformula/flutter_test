import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/favorite_restaurants_list/favorite_restaurant_list.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class MockRestaurantListBloc
    extends MockBloc<RestaurantListEvent, RestaurantListState>
    implements RestaurantListBloc {}

class MockFavoriteRestaurantsBloc
    extends MockBloc<FavoriteRestaurantsEvent, FavoriteRestaurantsState>
    implements FavoriteRestaurantsBloc {}

class MockRestaurant extends Mock implements Restaurant {}

void main() {
  late RestaurantListBloc restaurantListBloc;
  late FavoriteRestaurantsBloc favoriteRestaurantsBloc;
  late Restaurant mockRestaurant;

  setUp(() {
    restaurantListBloc = MockRestaurantListBloc();
    favoriteRestaurantsBloc = MockFavoriteRestaurantsBloc();
    mockRestaurant = MockRestaurant();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantListBloc>.value(value: restaurantListBloc),
        BlocProvider<FavoriteRestaurantsBloc>.value(
          value: favoriteRestaurantsBloc,
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(body: RestaurantListView()),
      ),
    );
  }

  group('RestaurantListView', () {
    testWidgets(
        'displays CircularProgressIndicator when state is RestaurantListLoading',
        (tester) async {
      when(() => restaurantListBloc.state)
          .thenReturn(const RestaurantListLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error message when state is RestaurantListError',
        (tester) async {
      when(() => restaurantListBloc.state)
          .thenReturn(const RestaurantListError(message: 'error'));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('error'), findsOneWidget);
    });

    testWidgets('displays RestaurantCards when state is RestaurantListData',
        (tester) async {
      final mockRestaurants = [
        mockRestaurant,
        mockRestaurant,
      ];

      when(() => restaurantListBloc.state)
          .thenReturn(RestaurantListData(restaurants: mockRestaurants));
      when(() => mockRestaurant.id).thenReturn('1');
      when(() => mockRestaurant.name).thenReturn('Restaurant 1');
      when(() => mockRestaurant.heroImage)
          .thenReturn('http://example.com/image.png');
      when(() => mockRestaurant.isOpen).thenReturn(true);
      when(() => mockRestaurant.price).thenReturn('\$\$');
      when(() => mockRestaurant.rating).thenReturn(4.5);
      when(() => mockRestaurant.displayCategory).thenReturn('Category');

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(RestaurantCard), findsNWidgets(2));
    });
  });
}
