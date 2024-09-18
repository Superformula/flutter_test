import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating_widget.dart';

import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('RestaurantTile displays restaurant details correctly',
      (WidgetTester tester) async {
    // Create a sample restaurant object
    final restaurant = Restaurant(
      id: '123',
      name: 'My Restaurant',
      photos: const ['https://picsum.photos/200/300'],
      price: '\$',
      categories: [Category(title: 'Italian')],
      rating: 4.5,
      hours: const [Hours(isOpenNow: true)],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantTile(restaurant: restaurant),
        ),
      ),
    );

    // Verify image is displayed
    final image = find.image(NetworkImage(restaurant.photos!.first));
    expect(image, findsOneWidget);

    // Verify restaurant name, price & category
    expect(find.text(restaurant.name!), findsOneWidget);
    expect(find.text(restaurant.price!), findsOneWidget);
    expect(find.text(restaurant.categories!.first.title!), findsOneWidget);

    // Verify star rating
    expect(find.widgetWithIcon(RestaurantStarRatingWidget, Icons.star),
        findsNWidgets(restaurant.rating!.toInt()));

    // Verify open status
    expect(
        find.widgetWithText(RestaurantOpenWidget, 'Open Now'), findsOneWidget);
  });
}
