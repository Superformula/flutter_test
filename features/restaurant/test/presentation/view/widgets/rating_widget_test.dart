import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/presentation/view/widgets/rating_widget.dart';

void main() {
  group('RatingWidget Tests', () {
    testWidgets(
        'Given a RatingWidget with rate 5, when rendered, it should display 5 stars',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingWidget(rate: 5),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(5));
    });

    testWidgets(
        'Given a RatingWidget with rate 3, when rendered, it should display 3 stars',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingWidget(rate: 3),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(3));
    });

    testWidgets(
        'Given a RatingWidget with rate 0, when rendered, it should display 0 stars',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingWidget(rate: 0),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNothing);
    });
  });
}
