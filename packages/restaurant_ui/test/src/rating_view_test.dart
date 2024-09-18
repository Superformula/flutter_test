import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

void main() {
  group('RatingView', () {
    testWidgets('displays the correct number of stars based on rating',
        (WidgetTester tester) async {
      const rating = 4.7;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingView(rating: rating),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(4));
    });

    testWidgets('displays no stars for a zero rating',
        (WidgetTester tester) async {
      const rating = 0.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingView(rating: rating),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNothing);
    });

    testWidgets('displays stars based on the truncated rating value',
        (WidgetTester tester) async {
      const rating = 3.9;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingView(rating: rating),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(3));
    });
  });
}
