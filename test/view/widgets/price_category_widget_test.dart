import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/restaurant_category_price_widget.dart'; // Import your widget

void main() {
  testWidgets(
      'RestaurantCategoryPriceWidget displays price and category correctly',
      (WidgetTester tester) async {
    // Test with provided price and category
    const price = "\$\$";
    const category = "Italian";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantCategoryPriceWidget(price: price, category: category),
        ),
      ),
    );

    expect(find.text(price), findsOneWidget);
    expect(find.text(category), findsOneWidget);

    // Test with null price and category
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantCategoryPriceWidget(price: null, category: null),
        ),
      ),
    );

    expect(find.text("\$\$"), findsOneWidget);
    expect(find.text(""), findsOneWidget);
  });
}
