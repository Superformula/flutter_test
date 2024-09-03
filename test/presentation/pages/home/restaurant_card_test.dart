import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/presentation/pages/home/widgets/restaurant_card_widget.dart';

void main() {
  group('RestaurantCard', () {
    testWidgets('should display the restaurant details correctly',
        (WidgetTester tester) async {
      const title = 'Test Restaurant';
      const subtitle = '\$\$ American';
      const rating = 4.0;
      const isOpen = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RestaurantCardWidget(
              imageUrl: '',
              title: title,
              subtitle: subtitle,
              rating: rating,
              isOpen: isOpen,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(subtitle), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(7));
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Icon && widget.color == Colors.yellow,
        ),
        findsNWidgets(4),
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Icon && widget.color == Colors.grey,
        ),
        findsOneWidget,
      );

      expect(find.text('Open now'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Icon && widget.color == Colors.green,
        ),
        findsOneWidget,
      );
    });
  });
}
