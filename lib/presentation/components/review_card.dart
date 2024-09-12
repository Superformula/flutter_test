import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/theme/typography.dart';
import 'package:restaurant_tour/domain/models/review.dart';
import 'package:restaurant_tour/presentation/components/rating_stars.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingStars(rating: review.rating!.toDouble()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            review.text!,
            style: AppTextStyles.openRegularHeadline,
          ),
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    review.user!.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              review.user!.name!,
              style: AppTextStyles.openRegularText,
            ),
          ],
        ),
      ],
    );
  }
}
