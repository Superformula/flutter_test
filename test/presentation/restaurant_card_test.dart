import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/home/presentation/widgets/restaurant_card.dart';

void main() {
  group('RestaurantCard', () {
    testWidgets('should display the restaurant details correctly',
        (WidgetTester tester) async {
      const name = 'Chefe Ramsy';
      const price = '\$\$';
      const rating = 4.4;
      const isOpenNow = true;
      const category = 'Italian';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantCard(
              photo: '',
              name: name,
              price: price,
              rating: rating,
              isOpenNow: isOpenNow,
              category: category,
            ),
          ),
        ),
      );

      expect(find.text(name), findsOneWidget);
      expect(find.text('Open Now'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Icon && widget.color == Colors.green,
        ),
        findsOneWidget,
      );
    });
  });
}
