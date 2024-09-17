import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

void main() {
  group('RestaurantCard', () {
    testWidgets('displays restaurant details correctly',
        (WidgetTester tester) async {
      const title = 'Test Restaurant';
      const isOpen = true;
      const price = r'\$\$';
      const rating = 4.5;
      const category = 'Italian';
      const photoUrl = 'https://example.com/photo.jpg';
      const tag = 'restaurant-tag';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantCard(
              title: title,
              isOpen: isOpen,
              price: price,
              rating: rating,
              category: category,
              photoUrl: photoUrl,
              tag: tag,
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text('$price $category'), findsOneWidget);
      expect(find.byType(RatingView), findsOneWidget);
      expect(find.byType(RestaurantStatus), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
    });

    testWidgets('calls onTap when card is tapped', (WidgetTester tester) async {
      var tapped = false;
      const title = 'Test Restaurant';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RestaurantCard(
              title: title,
              isOpen: true,
              price: r'$$',
              rating: 4.5,
              category: 'Italian',
              photoUrl: 'https://example.com/photo.jpg',
              tag: 'restaurant-tag',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RestaurantCard));
      expect(tapped, isTrue);
    });
  });

  group('RestaurantNetworkImage', () {
    testWidgets('displays image from network correctly',
        (WidgetTester tester) async {
      const photoUrl = 'https://example.com/photo.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantNetworkImage(
              photoUrl: photoUrl,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });
  });
}
