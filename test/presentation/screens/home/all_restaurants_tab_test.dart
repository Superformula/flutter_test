import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';
import 'package:restaurant_tour/presentation/screens/home/all_restaurants_tab.dart';
import '../../../fakes/repositories/fake_restaurants_repository.dart';
import '../../../make_testable_widget.dart';

void main() {
  late GetRestaurantsUseCase getRestaurantsUseCase;
  late ToggleFavoriteUseCase toggleFavoriteUseCase;
  late FakeRestaurantsRepository fakeRestaurantsRepository;

  setUp(() {
    fakeRestaurantsRepository = FakeRestaurantsRepository();
    getRestaurantsUseCase =
        GetRestaurantsUseCase(restaurantsRepository: fakeRestaurantsRepository);
    toggleFavoriteUseCase =
        ToggleFavoriteUseCase(restaurantsRepository: fakeRestaurantsRepository);
  });

  testWidgets('AllRestaurantsTab should render correctly', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: AllRestaurantsTab(
            toggleFavoriteUseCase: toggleFavoriteUseCase,
            getAllRestaurantsUseCase: getRestaurantsUseCase,
            favoriteRestaurants: [],
            onTapRestaurant: (restaurant, isFavorite) {},
          ),
        ),
      ),
    );

    expect(find.byType(AllRestaurantsTab), findsOneWidget);
  });

  testWidgets('AllRestaurantsTab onTapRestaurant callback should be called',
      (tester) async {
    var onTapRestaurantWasCalled = false;

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: AllRestaurantsTab(
            toggleFavoriteUseCase: toggleFavoriteUseCase,
            getAllRestaurantsUseCase: getRestaurantsUseCase,
            favoriteRestaurants: [],
            onTapRestaurant: (restaurant, isFavorite) {
              onTapRestaurantWasCalled = true;
            },
          ),
        ),
      ),
    );

    await mockNetworkImagesFor(() => tester.pumpAndSettle());

    await tester.tap(find.byType(RestaurantCard).first);

    expect(onTapRestaurantWasCalled, isTrue);
  });
}
