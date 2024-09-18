import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open_widget.dart'; // Import your widget

void main() {
  testWidgets('RestaurantOpenWidget displays status and icon correctly',
      (WidgetTester tester) async {
    // Test with restaurant open
    var isOpen = true;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantOpenWidget(isOpen),
        ),
      ),
    );
    // Verify "Open Now" text
    expect(find.text('Open Now'), findsOneWidget);
    expect(find.text('Closed'), findsNothing);

    // Verify icon
    final greenCircle = find.widgetWithIcon(Row, Icons.circle);
    expect(greenCircle, findsOneWidget);

    // Test with restaurant closed
    isOpen = false;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RestaurantOpenWidget(false),
        ),
      ),
    );

    // Verify "Closed" text
    expect(find.text('Open Now'), findsNothing);
    expect(find.text('Closed'), findsOneWidget);

    // Verify  icon
    final redCircle = find.widgetWithIcon(Row, Icons.circle);
    expect(redCircle, findsOneWidget);
  });
}
