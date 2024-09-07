import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';
import 'package:restaurant_tour/presentation/screens/home/home_screen.dart';

import '../../../fakes/repositories/fake_restaurants_repository.dart';
import '../../../make_testable_widget.dart';

void main() {
  late GetRestaurantsUseCase getRestaurantsUseCase;
  late GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
  late ToggleFavoriteUseCase toggleFavoriteUseCase;
  late FakeRestaurantsRepository fakeRestaurantsRepository;

  setUp(() {
    fakeRestaurantsRepository = FakeRestaurantsRepository();
    getRestaurantsUseCase =
        GetRestaurantsUseCase(restaurantsRepository: fakeRestaurantsRepository);
    getFavoriteRestaurantsUseCase = GetFavoriteRestaurantsUseCase(
        restaurantsRepository: fakeRestaurantsRepository);
    toggleFavoriteUseCase =
        ToggleFavoriteUseCase(restaurantsRepository: fakeRestaurantsRepository);
  });

  testWidgets('HomeScreen should render correctly', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: HomeScreen(
            toggleFavoriteUseCase: toggleFavoriteUseCase,
            getAllRestaurantsUseCase: getRestaurantsUseCase,
            getFavoriteRestaurantsUseCase: getFavoriteRestaurantsUseCase,
          ),
        ),
      ),
    );

    expect(find.byType(HomeScreen), findsOneWidget);

    expect(find.text("RestauranTour"), findsOneWidget);
    expect(find.text("All Restaurants"), findsOneWidget);
    expect(find.text("My Favorites"), findsOneWidget);

    await mockNetworkImagesFor(() => tester.pumpAndSettle());

    expect(find.byType(RestaurantCard), findsNWidgets(2));
  });

  testWidgets('should switch tabs', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: HomeScreen(
            toggleFavoriteUseCase: toggleFavoriteUseCase,
            getAllRestaurantsUseCase: getRestaurantsUseCase,
            getFavoriteRestaurantsUseCase: getFavoriteRestaurantsUseCase,
          ),
        ),
      ),
    );

    await mockNetworkImagesFor(
      () => tester.pumpAndSettle(const Duration(seconds: 1)),
    );

    expect(find.byType(RestaurantCard), findsWidgets);

    await tester.tap(find.text("My Favorites"));
    await tester.pumpAndSettle();

    // there is only one favorite restaurant
    expect(find.byType(RestaurantCard), findsNWidgets(1));
  });
}
