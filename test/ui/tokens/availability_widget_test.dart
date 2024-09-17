import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';
import 'package:restaurant_tour/ui/widgets/availability_widget.dart';

void main() {
  testWidgets('AvailabilityWidget shows "Open Now" when restaurant is open', (WidgetTester tester) async {
    // Arrange
    const isRestaurantOpen = true;

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvailabilityWidget(isRestaurantOpen: isRestaurantOpen),
        ),
      ),
    );

    // Assert
    expect(find.text(AppConstants.openNow), findsOneWidget);
    final circle = find.byType(DecoratedBox);
    final decoratedBox = tester.widget<DecoratedBox>(circle);
    final color = (decoratedBox.decoration as BoxDecoration).color;
    expect(color, OsColors.statusSuccess);
  });

  testWidgets('AvailabilityWidget shows "Closed" when restaurant is closed', (WidgetTester tester) async {
    // Arrange
    const isRestaurantOpen = false;

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvailabilityWidget(isRestaurantOpen: isRestaurantOpen),
        ),
      ),
    );

    // Assert
    expect(find.text(AppConstants.closed), findsOneWidget);
    final circle = find.byType(DecoratedBox);
    final decoratedBox = tester.widget<DecoratedBox>(circle);
    final color = (decoratedBox.decoration as BoxDecoration).color;
    expect(color, OsColors.statusError);
  });
}
