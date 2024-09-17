import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/pages/home/widgets/card_item.dart';
import 'package:restaurant_tour/ui/pages/restaurants/restaurant_list_page.dart';

class MockRestaurantProvider extends Mock implements RestaurantProvider {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockRestaurantProvider());
  });

  group('RestaurantListPage widget tests', () {
    testWidgets('Shows loading state', (WidgetTester tester) async {
      // Arrange
      final mockProvider = MockRestaurantProvider();

      when(() => mockProvider.isLoading).thenReturn(true);
      when(() => mockProvider.getRestaurants()).thenAnswer((_) async => Future.value());
      when(() => mockProvider.restaurants).thenReturn(null);
      when(() => mockProvider.errorMessage).thenReturn(null);

      await tester.pumpWidget(
        ChangeNotifierProvider<RestaurantProvider>.value(
          value: mockProvider,
          child: const MaterialApp(
            home: RestaurantListPage(),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      //Add Golden test for loading state
      await expectLater(
        find.byType(RestaurantListPage),
        matchesGoldenFile('goldens/restaurant_list_loading.png'),
      );
    });

    testWidgets('Shows list of restaurants', (WidgetTester tester) async {
      // Arrange
      final mockProvider = MockRestaurantProvider();
      final restaurant = RestaurantEntity(
        id: '123',
        name: 'Test Restaurant',
        price: '\$\$',
        rating: 4.5,
        categories: [],
        photos: [],
        hours: [Hours(isOpenNow: true)],
        reviews: [],
        location: Location(formattedAddress: '123 Test St.'),
      );

      when(() => mockProvider.isLoading).thenReturn(false);
      when(() => mockProvider.getRestaurants()).thenAnswer((_) async => Future.value());
      when(() => mockProvider.restaurants).thenReturn([restaurant]);
      when(() => mockProvider.errorMessage).thenReturn(null);

      await tester.pumpWidget(
        ChangeNotifierProvider<RestaurantProvider>.value(
          value: mockProvider,
          child: const MaterialApp(
            home: RestaurantListPage(),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.text('Test Restaurant'), findsOneWidget);
      expect(find.byType(CardItem), findsOneWidget);

      // Add golden test for list state
      await expectLater(
        find.byType(RestaurantListPage),
        matchesGoldenFile('goldens/restaurant_list_with_data.png'),
      );
    });

    testWidgets('Shows "No restaurants available" message when list is empty', (WidgetTester tester) async {
      // Arrange
      final mockProvider = MockRestaurantProvider();
      when(() => mockProvider.isLoading).thenReturn(false);
      when(() => mockProvider.getRestaurants()).thenAnswer((_) async => Future.value());
      when(() => mockProvider.restaurants).thenReturn([]);
      when(() => mockProvider.errorMessage).thenReturn(null);

      await tester.pumpWidget(
        ChangeNotifierProvider<RestaurantProvider>.value(
          value: mockProvider,
          child: const MaterialApp(
            home: RestaurantListPage(),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.text(AppConstants.noRestaurantsAvailable), findsOneWidget);
    });
  });
}
