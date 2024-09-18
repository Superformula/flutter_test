import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating_widget.dart';

class OverallRatingWidget extends StatelessWidget {
  const OverallRatingWidget({required this.rating, super.key});
  final double? rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        const Text('Overall Rating'),
        const Gap(16),
        Row(
          children: [
            Text(
              rating?.toString() ?? '0',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, top: 16.0),
              child: RestaurantStarRatingWidget(1),
            ),
          ],
        ),
        const Gap(16),
      ],
    );
  }
}
