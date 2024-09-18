import 'package:flutter/material.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

/// {@template restaurant_review}
/// A widget that displays a review for a restaurant, including the user's name,
/// profile picture, rating, and the review text.
///
/// It also includes a divider to separate reviews.
/// {@endtemplate}
class RestaurantReview extends StatelessWidget {
  /// {@macro restaurant_review}
  const RestaurantReview({
    required this.rating,
    required this.review,
    required this.userName,
    required this.userPhoto,
    super.key,
  });

  /// The rating given by the user for the restaurant, typically out of 5.
  final int rating;

  /// The actual review text provided by the user.
  final String review;

  /// The name of the user who submitted the review.
  final String userName;

  /// The URL of the user's profile picture.
  final String userPhoto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingView(rating: rating.toDouble()),
        const SizedBox(height: 8),
        Text(review, style: AppTextStyles.openRegularText),
        const SizedBox(height: 8),
        Row(
          children: [
            RestaurantNetworkImage(
              photoUrl: userPhoto,
              radius: 40,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8),
            Text(userName),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
