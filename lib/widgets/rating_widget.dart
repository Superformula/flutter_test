import 'package:flutter/material.dart';

import '../theme/colors.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double starSize;
  final Color starColor;

  const StarRating({
    super.key,
    required this.rating, // Rating should be between 0 to 5
    this.starSize = 12.0,
    this.starColor = ThemeColors.starColor,
  }) : assert(rating >= 0 && rating <= 5);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating, (index) {
        return Icon(
          Icons.star,
          size: starSize,
          color: starColor,
        );
      }),
    );
  }
}
