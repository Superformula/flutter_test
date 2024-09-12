import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/theme/colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final rating = this.rating.round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < rating; i++)
          const Icon(Icons.star, color: AppColors.star, size: 12),
      ],
    );
  }
}
