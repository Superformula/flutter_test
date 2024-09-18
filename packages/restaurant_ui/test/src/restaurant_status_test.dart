import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

void main() {
  group('RestaurantStatus', () {
    testWidgets('displays "Open now" with green icon when isOpen is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantStatus(isOpen: true),
          ),
        ),
      );

      expect(find.text('Open now'), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.circle));
      expect(icon.color, Colors.green);
    });

    testWidgets('displays "Closed" with red icon when isOpen is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantStatus(isOpen: false),
          ),
        ),
      );

      expect(find.text('Closed'), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.circle));
      expect(icon.color, Colors.red);
    });

    testWidgets('ensures proper layout with spacing between text and icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantStatus(isOpen: true),
          ),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      final children = row.children;
      expect(children.length, 3);

      final sizedBox = children[1] as SizedBox;
      expect(sizedBox.width, 4);
    });
  });
}
