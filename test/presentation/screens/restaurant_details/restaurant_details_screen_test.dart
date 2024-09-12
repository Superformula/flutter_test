import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:restaurant_tour/presentation/screens/restaurant_details/restaurant_details_screen.dart';
import '../../../fakes/data/fake_restaurant.dart';
import '../../../make_testable_widget.dart';

void main() {
  testWidgets('RestaurantDetailsScreen should render correctly',
      (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: RestaurantDetailsScreen(
            restaurant: fakeRestaurant.toDomain(),
            isFavorite: false,
            onToggleFavorite: () {},
          ),
        ),
      ),
    );

    expect(find.byType(RestaurantDetailsScreen), findsOneWidget);

    expect(find.text(fakeRestaurant.name!), findsOneWidget);
    // is open now
    expect(find.text("Open Now"), findsOneWidget);
    // is not favorite
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
