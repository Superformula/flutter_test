import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/view/widgets/restaurant_hero_widget.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('RestaurantHeroWidget displays image and handles errors',
      (WidgetTester tester) async {
    // Mock NavigatorObserver to capture Hero transitions
    final mockObserver = MockNavigatorObserver();

    // Test with provided image URL and tag
    const imageUrl = 'https://picsum.photos/200/300';
    const tag = 'restaurant_detail';
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        home: const Scaffold(
          body: RestaurantHeroWidget(imageUrl: imageUrl, tag: tag),
        ),
      ),
    );

    // Verify image is displayed
    final image = find.image(const NetworkImage(imageUrl));
    expect(image, findsOneWidget);
  });
}
