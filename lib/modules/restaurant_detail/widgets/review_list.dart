import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/design_system/design_system.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      padding: const EdgeInsets.symmetric(
        vertical: DsSizes.md,
      ),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final currentReview = reviews[index];
        print(currentReview.text);

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: DsSizes.xxxs,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DsRating(
                initialRating: currentReview.rating?.toDouble() ?? 0.0,
                itemCount: 5,
              ),
              const SizedBox(height: DsSizes.xxxs),
              if (currentReview.text != null)
                DsText(
                  currentReview.text ?? 'No content',
                ),
              const SizedBox(height: DsSizes.xxxs),
              UserAvatar(
                name: '${currentReview.user?.name}',
                urlImage: currentReview.user?.imageUrl,
              ),
            ],
          ),
        );
      },
    );
  }
}
