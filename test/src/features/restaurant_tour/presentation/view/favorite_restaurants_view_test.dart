import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_info_page.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/favorite_restaurants_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockSharedPreferences mockSharedPreferences;
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockNavigatorObserver = MockNavigatorObserver();
    SharedPreferences.setMockInitialValues({});
  });

  group('Favorite Restaurants View tests', () {
    testWidgets(
      'FavoriteRestaurantsView displays empty message when no favorites',
      (WidgetTester tester) async {
        when(() => mockSharedPreferences.getKeys()).thenReturn({});
        when(() => mockSharedPreferences.getBool(any())).thenReturn(false);

        await tester.pumpWidget(
          MaterialApp(
            home: const Scaffold(
              body: FavoriteRestaurantsView(),
            ),
            navigatorObservers: [mockNavigatorObserver],
          ),
        );

        expect(find.byIcon(Icons.restaurant), findsOneWidget);
        expect(find.text(sorryText), findsOneWidget);
        expect(find.text(noFavoriteRestaurantsText), findsOneWidget);
      },
    );

    testWidgets(
      'Should call _loadFavorites when navigating back with result true',
      (WidgetTester tester) async {
        when(() => mockSharedPreferences.getKeys())
            .thenReturn({'restaurant_id'});
        when(() => mockSharedPreferences.getBool('restaurant_id'))
            .thenReturn(true);

        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: const Scaffold(
                body: FavoriteRestaurantsView(),
              ),
              navigatorObservers: [mockNavigatorObserver],
            ),
          ),
        );

        final testRestaurant = mockRestaurants[0];
        await mockNetworkImagesFor(
          () => tester.pumpAndSettle(const Duration(seconds: 2)),
        );

        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: RestaurantInfoPage(restaurant: testRestaurant),
            ),
          ),
        );
        Navigator.pop(tester.element(find.byType(RestaurantInfoPage)), true);
        await mockNetworkImagesFor(
          () => tester.pumpAndSettle(const Duration(seconds: 2)),
        );
      },
    );
  });
}
