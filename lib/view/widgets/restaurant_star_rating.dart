import 'package:flutter/material.dart';

class RestaurantStarRating extends StatelessWidget {
  const RestaurantStarRating(this.rating, {super.key});
  final starColor = const Color(0xFFFFB800);
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i <= rating; i++)
          Icon(
            Icons.star,
            size: 12,
            color: starColor,
          )
      ],
    );
  }
}
