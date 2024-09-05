import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/view/widgets/cards/review_card.dart';

import '../../../../mocks/helpers.dart';

void main() {
  group('ReviewCard Widget Tests', () {
    late Review review;

    setUp(() {
      review = Review.fromJson(mockedReview(
        text: 'Great food and service!',
        user: {
          'name': 'John Doe',
          'imageUrl': 'https://example.com/photo.jpg',
        },
        rating: 5,
      ));
    });

    testWidgets(
        'Given a review without user image, when rendered, then it should display the user initials in a placeholder',
        (WidgetTester tester) async {
      review = Review.fromJson(mockedReview(
        text: 'Amazing experience!',
        user: {
          'name': 'Jane Smith',
          'image_url': null, // No image URL provided
        },
        rating: 4,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReviewCard(review: review),
          ),
        ),
      );

      expect(find.text('Amazing experience!'), findsOneWidget);
      expect(find.text('JS'), findsOneWidget); // Initials for "Jane Smith"
      expect(find.byType(CachedNetworkImage), findsNothing);
      expect(find.text('Jane Smith'), findsOneWidget);
    });
  });
}
