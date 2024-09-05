import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/routes/params/route_details_params.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';

import '../../../../mocks/server_responses.dart';

void main() {
  group('RestaurantCard Widget Tests', () {
    late Restaurant restaurant;

    setUp(() {
      restaurant =
          Restaurant.fromJson(mockedRestaurant(name: 'Test Restaurant'));
    });

    testWidgets(
        'Given a restaurant with no image, when rendered, then it should display the error icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RestaurantCard(restaurant: restaurant, index: 1),
          ),
        ),
      );

      expect(find.text('Test Restaurant'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets(
        'Given the restaurant card, when tapped, then it should navigate to the restaurant details screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            if (settings.name == '/restaurant/details') {
              final RouteDetailsParams args =
                  settings.arguments as RouteDetailsParams;
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Text('Details for ${args.restaurant.name}'),
                ),
              );
            }
            return null;
          },
          home: Scaffold(
            body: RestaurantCard(restaurant: restaurant, index: 1),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.text('Details for Test Restaurant'), findsOneWidget);
    });
  });
}
