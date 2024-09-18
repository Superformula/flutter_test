import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating_widget.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile(this.review, {super.key});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestaurantStarRatingWidget(review.rating ?? 1),
        const Gap(12),
        Text(
          review.text ?? 'no comment',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(12),
        Row(
          children: [
            CircleAvatar(
              onForegroundImageError: (exception, stackTrace) => const Center(
                child: Icon(Icons.error),
              ),
              foregroundImage: NetworkImage(
                review.user?.imageUrl ?? 'https://picsum.photos/200/300',
              ),
            ),
            const Gap(8),
            Text(review.user?.name ?? 'user name'),
          ],
        ),
      ],
    );
  }
}
