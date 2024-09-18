import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating_widget.dart'; // Import your widget

void main() {
  testWidgets('RestaurantStarRating displays correct number of stars',
      (WidgetTester tester) async {
    // Test with rating 3
    const rating = 3;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RestaurantStarRatingWidget(rating),
        ),
      ),
    );

    await tester.pump();

    // Verify 3 star icons
    expect(find.widgetWithIcon(Row, Icons.star), findsNWidgets(rating));

    // Test with rating 0
    const zeroRating = 0;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RestaurantStarRatingWidget(zeroRating),
        ),
      ),
    );
    await tester.pump();

    // Verify no star icons
    expect(find.widgetWithIcon(Row, Icons.star), findsNothing);
  });
}
