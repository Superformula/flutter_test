/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/controllers/favorite_restaurant_view_controller.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/ui/screens/home_screen.dart';
import 'package:restaurant_tour/ui/screens/restaurants_favorites_screen.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen.dart';

class MockRestaurantViewController extends Mock implements RestaurantViewController {}

class MockFavoriteRestaurantViewController extends Mock implements FavoriteRestaurantViewController {}

void main() {
  late MockRestaurantViewController mockRestaurantViewController;
  late MockFavoriteRestaurantViewController mockFavoriteRestaurantViewController;

  setUp(() {
    mockRestaurantViewController = MockRestaurantViewController();
    mockFavoriteRestaurantViewController = MockFavoriteRestaurantViewController();
  });

  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          restaurantViewController: mockRestaurantViewController,
          favoriteRestaurantViewController: mockFavoriteRestaurantViewController,
        ),
      ),
    );

    expect(find.text('RestauranTour'), findsOneWidget);
    expect(find.text('All Restaurants'), findsOneWidget);
    expect(find.text('My Favorites'), findsOneWidget);
  });

  testWidgets('HomeScreen has two tabs', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          restaurantViewController: mockRestaurantViewController,
          favoriteRestaurantViewController: mockFavoriteRestaurantViewController,
        ),
      ),
    );

    expect(find.byType(Tab), findsNWidgets(2));
  });

  testWidgets('HomeScreen switches between tabs', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          restaurantViewController: mockRestaurantViewController,
          favoriteRestaurantViewController: mockFavoriteRestaurantViewController,
        ),
      ),
    );

    expect(find.byType(RestaurantsListScreen), findsOneWidget);
    expect(find.byType(FavoriteRestaurantsScreen), findsNothing);

    await tester.tap(find.text('My Favorites'));
    await tester.pumpAndSettle();

    expect(find.byType(RestaurantsListScreen), findsNothing);
    expect(find.byType(FavoriteRestaurantsScreen), findsOneWidget);
  });
}
*/
