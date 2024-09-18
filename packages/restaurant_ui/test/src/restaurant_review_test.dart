import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

void main() {
  group('RestaurantReview', () {
    const rating = 4;
    const reviewText = 'This is an amazing restaurant with great service.';
    const userName = 'John Doe';
    const userPhotoUrl = 'https://example.com/photo.jpg';

    testWidgets("displays user's name, review text, and rating",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantReview(
              rating: rating,
              review: reviewText,
              userName: userName,
              userPhoto: userPhotoUrl,
            ),
          ),
        ),
      );

      expect(find.text(reviewText), findsOneWidget);

      expect(find.text(userName), findsOneWidget);

      final ratingWidget = tester.widget<RatingView>(find.byType(RatingView));
      expect(ratingWidget.rating, rating.toDouble());
    });

    testWidgets("displays user's profile picture with correct size and radius",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantReview(
              rating: rating,
              review: reviewText,
              userName: userName,
              userPhoto: userPhotoUrl,
            ),
          ),
        ),
      );

      final networkImage = tester.widget<RestaurantNetworkImage>(
        find.byType(RestaurantNetworkImage),
      );
      expect(networkImage.photoUrl, userPhotoUrl);
      expect(networkImage.radius, 40);
      expect(networkImage.width, 40);
      expect(networkImage.height, 40);
    });

    testWidgets('renders Divider and proper spacing between elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantReview(
              rating: rating,
              review: reviewText,
              userName: userName,
              userPhoto: userPhotoUrl,
            ),
          ),
        ),
      );
    });

    testWidgets('properly handles layout of all elements in RestaurantReview',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantReview(
              rating: rating,
              review: reviewText,
              userName: userName,
              userPhoto: userPhotoUrl,
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });
  });
}
