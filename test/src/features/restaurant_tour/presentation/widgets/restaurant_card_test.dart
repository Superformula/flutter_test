import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_info_page.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_image.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_info.dart';

void main() {
  group(
    'Restaurant Card tests',
    () {
      testWidgets('RestaurantCard displays correctly and navigates on tap',
          (WidgetTester tester) async {
        final restaurant = mockRestaurants[0];

        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: RestaurantCard(restaurant: restaurant),
              ),
            ),
          ),
        );

        expect(find.text('Pasta Paradise'), findsOneWidget);
        expect(find.byType(RestaurantCardImage), findsOneWidget);
        expect(find.byType(RestaurantCardInfo), findsOneWidget);

        // Simulate a tap on the RestaurantCard
        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();

        expect(find.byType(RestaurantInfoPage), findsOneWidget);
      });

      testWidgets('RestaurantCard calls onTap callback when tapped',
          (WidgetTester tester) async {
        final restaurant = mockRestaurants[0];

        bool wasTapped = false;

        // Build the widget with an onTap callback
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: RestaurantCard(
                  restaurant: restaurant,
                  onTap: () {
                    wasTapped = true;
                  },
                ),
              ),
            ),
          ),
        );

        // Simulate a tap on the RestaurantCard
        await tester.tap(find.byType(InkWell));
        await tester.pump();
        expect(wasTapped, true);
      });
    },
  );
}
