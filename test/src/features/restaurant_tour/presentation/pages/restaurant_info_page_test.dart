import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPreferences;
  late Restaurant testRestaurant;

  setUp(() {
    mockPreferences = MockSharedPreferences();
    SharedPreferences.setMockInitialValues({});
    testRestaurant = mockRestaurants[0];

    when(() => mockPreferences.getBool(testRestaurant.id ?? ''))
        .thenReturn(false);
  });

  Future<void> buildPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantInfoPage(restaurant: testRestaurant),
      ),
    );
  }

  group('Restaurant Info Page tests', () {
    testWidgets('Should display restaurant name in the AppBar',
        (WidgetTester tester) async {
      await buildPage(tester);
      await mockNetworkImagesFor(() => tester.pumpAndSettle());
      expect(find.text('Pasta Paradise'), findsOneWidget);
    });

    testWidgets('Should display favorite icon as not selected initially',
        (WidgetTester tester) async {
      await buildPage(tester);
      await mockNetworkImagesFor(() => tester.pumpAndSettle());
      final favoriteIcon = find.byIcon(Icons.favorite_outline);
      expect(favoriteIcon, findsOneWidget);
    });

    testWidgets('Should toggle favorite status when icon is tapped',
        (WidgetTester tester) async {
      // Simulate that initially, the restaurant is not a favorite
      when(() => mockPreferences.getBool(testRestaurant.id ?? ''))
          .thenReturn(false);
      when(() => mockPreferences.setBool(testRestaurant.id ?? '', true))
          .thenAnswer((_) async => true);
      when(() => mockPreferences.setBool(testRestaurant.id ?? '', false))
          .thenAnswer((_) async => true);

      await buildPage(tester);

      final favoriteIconButton = find.byIcon(Icons.favorite_outline);
      expect(favoriteIconButton, findsOneWidget);

      // Tap the favorite icon to toggle the favorite status
      await tester.tap(favoriteIconButton);
      await mockNetworkImagesFor(
        () => tester.pumpAndSettle(),
      );
    });
  });
}
