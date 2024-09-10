import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/pages/restaurant_details/widgets/restaurant_details_favorite_button.dart';

void main() {
  testWidgets('Tapping favorite button toggles favorite icon', (WidgetTester tester) async {
    // Create a full test restaurant
    final restaurant = Restaurant(id: '1', name: 'Best Restaurant');

    // Build the widget within a ProviderScope to simulate Riverpod environment
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                RestaurantDetailsFavoriteButton(restaurant: restaurant),
              ],
              centerTitle: true,
              title: Text(
                restaurant.name!,
                style: const TextStyle(
                  fontFamily: 'Lora',
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Initially, the IconButton should display Icons.favorite_border
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);

    // Tap the favorite button
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();  // Rebuild the widget to reflect changes in the state

    // After tapping, the IconButton should display Icons.favorite
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);

    // Tap the favorite button again to remove from favorites
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();  // Rebuild the widget to reflect changes in the state

    // After tapping again, it should go back to showing Icons.favorite_border
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });
}
