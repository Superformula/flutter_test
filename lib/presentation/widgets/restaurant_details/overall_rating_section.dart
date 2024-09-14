import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

class OverallRatingSection extends StatelessWidget {
  const OverallRatingSection({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Overall Rating',
            style: AppTextStyles.openRegularText,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                restaurant.rating.toString(),
                style: AppTextStyles.loraRegularHeadline,
                textAlign: TextAlign.start,
              ),
              const Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
      ],
    );
  }
}
