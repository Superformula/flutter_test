import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/favorite_restaurants_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    SharedPreferences.setMockInitialValues({});
  });

  group('Favorite Restaurants View tests', () {
    testWidgets(
        'FavoriteRestaurantsView displays empty message when no favorites',
        (WidgetTester tester) async {
      // Mock the SharedPreferences to return no keys
      when(() => mockSharedPreferences.getKeys()).thenReturn({});
      when(() => mockSharedPreferences.getBool(any())).thenReturn(false);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FavoriteRestaurantsView(),
          ),
        ),
      );

      expect(find.byIcon(Icons.restaurant), findsOneWidget);
      expect(find.text(sorryText), findsOneWidget);
      expect(find.text(noFavoriteRestaurantsText), findsOneWidget);
    });
  });
}
