import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/widgets/is_open_widget.dart';

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${restaurant.price}',
                    style: AppTextStyles.openRegularText,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.categories?.first.alias ?? '',
                    style: AppTextStyles.openRegularText,
                  ),
                ],
              ),
              IsOpenWidget(isOpen: restaurant.isOpen),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
      ],
    );
  }
}
