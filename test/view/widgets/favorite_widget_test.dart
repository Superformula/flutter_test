import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/favorite_button_widget.dart';

void main() {
  testWidgets('FavoriteButtonWidget toggles icon and calls callback',
      (WidgetTester tester) async {
    bool isFavorite = false;
    callback(bool newValue) {
      isFavorite = newValue;
    }

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body:
              FavoriteButtonWidget(callback: callback, isFavorite: isFavorite),
        ),
      ),
    );

    // Verify initial state
    expect(find.byIcon(Icons.favorite_outline), findsOneWidget);
    expect(isFavorite, false);

    // Tap the button
    await tester.tap(find.byIcon(Icons.favorite_outline));
    await tester.pump();

    // Verify updated state
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(isFavorite, true);

    // Tap the button again
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify final state
    expect(find.byIcon(Icons.favorite_outline), findsOneWidget);
    expect(isFavorite, false);
  });
}
