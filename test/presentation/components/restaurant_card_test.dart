import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';
import '../../fakes/data/fake_restaurant.dart';
import '../../make_testable_widget.dart';

void main() {
  testWidgets('RestaurantCard should render correctly', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: RestaurantCard(
            restaurant: fakeRestaurant.toDomain(),
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(RestaurantCard), findsOneWidget);
  });

  testWidgets('RestaurantCard onTap callback should be called', (tester) async {
    var onTapCalled = false;

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: RestaurantCard(
            restaurant: fakeRestaurant.toDomain(),
            onTap: () {
              onTapCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(RestaurantCard));

    expect(onTapCalled, isTrue);
  });
}
