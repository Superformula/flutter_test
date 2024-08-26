import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/models.dart';
import 'package:restaurant_tour/theme/text.dart';
import 'package:restaurant_tour/utils/get_random_avatar.dart';
import 'package:restaurant_tour/widgets/widgets.dart';
import '../theme/colors.dart';

class BuildRatingSection extends StatelessWidget {
  const BuildRatingSection({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall Rating',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 16,
        ),
        overallClassificationRow(context),
        const SizedBox(
          height: spacingXL,
        ),
        buildDivider(),
        const SizedBox(
          height: spacingXL,
        ),
        Text(
          '${restaurant.reviews?.length} reviews',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        // const SizedBox(
        //   height: spacingXL,
        // ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurant.reviews?.length,
          itemBuilder: (context, index) {
            var review = restaurant.reviews?[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: spacingM,
                ),
                StarRating(
                  rating: review?.rating ?? 0,
                ),
                const SizedBox(
                  height: spacingSM,
                ),
                review?.text != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          review!.text!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: review?.user?.imageUrl != null
                          ? NetworkImage(review!.user!.imageUrl!)
                          : getRandomAvatar(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(review?.user?.name ?? 'Not identified'),
                  ],
                ),
                const SizedBox(
                  height: spacingM,
                ),
                buildDivider()
              ],
            );
          },
        ),
      ],
    );
  }

  Row overallClassificationRow(BuildContext context) {
    return Row(
      children: [
        Text(
          restaurant.rating.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          width: 6,
        ),
        const Icon(
          Icons.star,
          color: ThemeColors.starColor,
        ),
      ],
    );
  }
}
