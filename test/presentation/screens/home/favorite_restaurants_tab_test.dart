import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';
import 'package:restaurant_tour/presentation/screens/home/favorite_restaurants_tab.dart';

import '../../../fakes/data/fake_restaurant.dart';
import '../../../make_testable_widget.dart';

void main() {
  testWidgets('FavoriteRestaurantsTab should render correctly', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: FavoriteRestaurantsTab(
            restaurants: [
              fakeRestaurant.toDomain(),
              fakeRestaurant2.toDomain()
            ],
            onTapRestaurant: (restaurant, isFavorite) {},
          ),
        ),
      ),
    );

    expect(find.byType(FavoriteRestaurantsTab), findsOneWidget);
  });

  testWidgets(
      'FavoriteRestaurantsTab onTapRestaurant callback should be called',
      (tester) async {
    var onTapRestaurantWasCalled = false;

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: FavoriteRestaurantsTab(
            restaurants: [
              fakeRestaurant.toDomain(),
              fakeRestaurant2.toDomain()
            ],
            onTapRestaurant: (restaurant, isFavorite) {
              onTapRestaurantWasCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(RestaurantCard).first);

    expect(onTapRestaurantWasCalled, isTrue);
  });
}
