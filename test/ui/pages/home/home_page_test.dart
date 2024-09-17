import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/ui/pages/favorites/favorites_restaurants_page.dart';
import 'package:restaurant_tour/ui/pages/home/home_page.dart';
import 'package:restaurant_tour/ui/pages/restaurants/restaurant_list_page.dart';

class MockRestaurantProvider extends Mock implements RestaurantProvider {}

class MockFavoritesProvider extends Mock implements FavoritesProvider {}

void main() {
  testWidgets('HomePage renders TabBar and switches tabs correctly', (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockRestaurantProvider();
    final mockFavorites = MockFavoritesProvider();
    when(() => mockProvider.isLoading).thenReturn(false);
    when(() => mockProvider.restaurants).thenReturn([]);
    when(() => mockProvider.getRestaurants()).thenAnswer((_) async => Future.value());
    when(() => mockFavorites.favoriteRestaurants).thenReturn([]);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantProvider>.value(value: mockProvider),
          ChangeNotifierProvider<FavoritesProvider>.value(value: mockFavorites),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
    // Assert
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(RestaurantListPage), findsOneWidget);
    expect(find.byType(FavoritesRestaurantsPage), findsNothing);

    await tester.tap(find.text('My Favorites'));
    await tester.pumpAndSettle();

    expect(find.byType(FavoritesRestaurantsPage), findsOneWidget);
    expect(find.byType(RestaurantListPage), findsNothing);

    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('goldens/home_page_golden.png'),
    );
  });
}
