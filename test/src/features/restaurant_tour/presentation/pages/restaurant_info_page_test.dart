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
    testRestaurant = mockRestaurants[0];
  });

  Future<void> buildPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantInfoPage(restaurant: testRestaurant),
      ),
    );
  }

  group(
    'Restaurant Info Page tests',
    () {
      testWidgets('Should display restaurant name in the AppBar',
          (WidgetTester tester) async {
        await buildPage(tester);

        await mockNetworkImagesFor(() => tester.pumpAndSettle());

        expect(find.text('Pasta Paradise'), findsOneWidget);
      });

      testWidgets('Should display favorite icon as not selected initially',
          (WidgetTester tester) async {
        when(() => mockPreferences.getBool('1')).thenReturn(false);
        await buildPage(tester);

        await mockNetworkImagesFor(() => tester.pumpAndSettle());
        final favoriteIcon = find.byIcon(Icons.favorite_outline);
        expect(favoriteIcon, findsOneWidget);
      });

      testWidgets('Should navigate back when back button is pressed',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: RestaurantInfoPage(restaurant: testRestaurant),
          ),
        );

        final backButton = find.byIcon(Icons.arrow_back);
        await tester.tap(backButton);
        await mockNetworkImagesFor(
          () => tester.pump(
            const Duration(seconds: 2),
          ),
        );

        expect(find.byType(RestaurantInfoPage), findsOneWidget);
      });

      testWidgets('Should toggle favorite status when icon is tapped',
          (WidgetTester tester) async {
        when(() => mockPreferences.getBool('1')).thenReturn(false);
        when(() => mockPreferences.setBool('1', true))
            .thenAnswer((_) async => true);

        await buildPage(tester);

        final favoriteIconButton = find.byIcon(Icons.favorite_outline);
        expect(favoriteIconButton, findsOneWidget);

        await tester.tap(favoriteIconButton);
        await mockNetworkImagesFor(() => tester.pumpAndSettle());
      });
    },
  );
}
