import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/widgets/ratings.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviews.length ?? 0,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Ratings(rating: review.rating?.toDouble() ?? 0),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                review.text ?? 'description text',
                style: AppTextStyles.openRegularHeadline,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(review.user?.imageUrl ?? ''),
                  ),
                  Text(
                    review.user?.name ?? '',
                    style: AppTextStyles.openRegularText,
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
