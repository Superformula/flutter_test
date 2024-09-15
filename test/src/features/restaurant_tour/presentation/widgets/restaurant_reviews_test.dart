import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_reviews.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';

void main() {
  testWidgets('RestaurantReviews displays correctly',
      (WidgetTester tester) async {
    const review = Review(
      rating: 3,
      text: 'Great restaurant!',
      user: User(
        name: 'John Doe',
        imageUrl: 'https://example.com/image.jpg',
      ),
    );

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantReviews(reviews: review),
          ),
        ),
      ),
    );

    // Verify the number of StarIcons
    final starIcons = find.byType(StarIcon);
    expect(starIcons, findsNWidgets(3));

    // Verify the review text is displayed correctly
    final textFinder = find.text('Great restaurant!');
    expect(textFinder, findsOneWidget);

    // Verify the user's image is displayed correctly
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    // Verify the user's name is displayed correctly
    final nameFinder = find.text('John Doe');
    expect(nameFinder, findsOneWidget);
  });
}
