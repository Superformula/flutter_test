import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/core/colors/app_colors.dart';

class StarRatingIndicator extends StatelessWidget {
  final int rating;

  const StarRatingIndicator({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < rating ? AppColors.ratingStarColor : Colors.grey,
          size: 12,
        ),
      ),
    );
  }
}
