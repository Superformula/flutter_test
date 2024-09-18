import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/overall_rating_widget.dart'; // Import your widget

void main() {
  testWidgets('OverallRatingWidget displays rating correctly',
      (WidgetTester tester) async {
    // Test with a provided rating
    const rating = 4.5;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverallRatingWidget(rating: rating),
        ),
      ),
    );

    expect(find.text(rating.toString()), findsOneWidget);

    // Test with a null rating
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverallRatingWidget(rating: null),
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
  });
}
