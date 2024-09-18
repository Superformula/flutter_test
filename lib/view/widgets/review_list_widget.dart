import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/review_tile.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({required this.reviews, super.key});
  final List<Review>? reviews;
  @override
  Widget build(BuildContext context) {
    return (reviews?.isNotEmpty ?? false)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              Text(
                '${reviews!.length} Reviews',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Gap(16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ReviewTile(reviews![index]);
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                itemCount: reviews!.length,
              ),
            ],
          )
        : const Text('This restaurant has no reviews');
  }
}
