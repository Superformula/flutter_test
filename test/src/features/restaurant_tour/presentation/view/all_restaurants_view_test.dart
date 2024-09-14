import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/all_restaurants_view.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(
      const RestaurantQueryResult(
        restaurants: [],
        total: 0,
      ),
    );
  });

  group(
    'All Restaurants View tests',
    () {
      testWidgets('should display progress indicator',
          (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: AllRestaurantsView(),
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    },
  );
}
