import 'package:flutter/material.dart';

class RestaurantReview extends StatelessWidget {
  const RestaurantReview({
    required this.rating,
    required this.review,
    required this.userName,
    required this.userPhoto,
    super.key,
  });

  final double rating;
  final String review;
  final String userName;
  final String userPhoto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(rating.toString()),
        Text(review),
        Row(
          children: [
            Text(userName),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
