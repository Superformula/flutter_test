import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating_widget.dart';
import 'package:restaurant_tour/view/widgets/review_tile.dart';

void main() {
  testWidgets('ReviewTile displays review details correctly',
      (WidgetTester tester) async {
    // Create sample Review and User objects
    final user =
        User(name: 'John Doe', imageUrl: 'https://picsum.photos/200/300');
    final review = Review(rating: 4, text: 'Great food!', user: user);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReviewTile(review),
        ),
      ),
    );
    await tester.pump();
    // Verify star rating
    expect(find.widgetWithIcon(RestaurantStarRatingWidget, Icons.star),
        findsNWidgets(review.rating!.toInt()));

    // Verify review text
    expect(find.text(review.text!), findsOneWidget);

    // Verify user name
    expect(find.text(user.name!), findsOneWidget);
  });
}
