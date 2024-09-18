import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:restaurant_tour/main.dart';
import 'package:restaurant_tour/view/widgets/favorite_button_widget.dart';
import 'package:restaurant_tour/view/widgets/favorite_list_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_hero_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Tapping on RestaurantTitle navigates to correct page',
        (WidgetTester tester) async {
      // init
      await tester.pumpWidget(
        const RestaurantTour(
          testMode: true,
        ),
      );
      await tester.pumpAndSettle();

      // find and tap restaurant tile
      final restaurantTitleFinder = find.byType(RestaurantTile);
      expect(restaurantTitleFinder, findsAny);
      await tester.tap(restaurantTitleFinder.first);

      // // Trigger a frame.
      await tester.pumpAndSettle();

      // // Verify hero widget is found.
      expect(
        find.byWidgetPredicate((widget) => widget is RestaurantHeroWidget),
        findsOneWidget,
      );
    });

    testWidgets('Tapping on Favorite Tab navigates to correct page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const RestaurantTour(
          testMode: true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(Tab).last);

      // // Trigger a frame.
      await tester.pumpAndSettle();

      // // Verify hero widget is found.
      expect(
        find.byType(FavoriteListWidget),
        findsOneWidget,
      );
    });

    testWidgets(
        'Tapping on FavoriteButtonWidget add Restaurant to Favorite Restaurant List page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const RestaurantTour(
          testMode: true,
        ),
      );
      await tester.pumpAndSettle();

      final restaurantTitleFinder =
          find.byWidgetPredicate((widget) => widget is RestaurantTile);
      expect(restaurantTitleFinder, findsAny);
      await tester.tap(restaurantTitleFinder.first);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // // Verify hero widget is found.
      final favoriteButton = find.byType(FavoriteButtonWidget);
      expect(
        favoriteButton,
        findsOneWidget,
      );
      await tester.tap(favoriteButton);
      // Trigger a frame.
      await tester.pumpAndSettle();
      await tester.pageBack();
      // Trigger a frame.
      await tester.pumpAndSettle();
      final favoriteTab = find.byType(Tab).last;
      await tester.tap(favoriteTab);
      // Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.byType(RestaurantTile), findsOne);
    });

    testWidgets(
        'Tapping on FavoriteButtonWidget again removes Restaurant to Favorite Restaurant List page',
        (WidgetTester tester) async {
      //Init
      await tester.pumpWidget(
        const RestaurantTour(
          testMode: true,
        ),
      );
      await tester.pumpAndSettle();

      // Tap first Restaurant on the list
      final restaurantTitleFinder = find.byType(RestaurantTile);
      expect(restaurantTitleFinder, findsAny);
      await tester.tap(restaurantTitleFinder.first);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Tap Favorite Widget
      final favoriteButton = find.byType(FavoriteButtonWidget);
      expect(
        favoriteButton,
        findsOneWidget,
      );
      await tester.tap(favoriteButton);
      // Trigger a frame.
      await tester.pumpAndSettle();

      // Check if restaurant was added
      await tester.pageBack();
      // Trigger a frame.
      await tester.pumpAndSettle();
      final favoriteTab = find.byType(Tab).last;
      await tester.tap(favoriteTab);
      // Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.byType(RestaurantTile), findsOne);

      // Now open the favorite restaurant
      await tester.tap(restaurantTitleFinder.first);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Tap Favorite Widget to remove it
      expect(
        favoriteButton,
        findsOneWidget,
      );
      await tester.tap(favoriteButton);

      // go back and check if list is empty
      await tester.pageBack();
      await tester.pumpAndSettle();

      expect(find.byType(RestaurantTile), findsNothing);
    });
  });
}
