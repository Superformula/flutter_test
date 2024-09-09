import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/typography.dart';

final class RestaurantAvailability extends StatelessWidget {
  const RestaurantAvailability({
    super.key,
    required this.isRestaurantOpen,
  });

  final bool isRestaurantOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isRestaurantOpen ? 'Open Now' : 'Closed',
          style: AppTextStyles.openRegularItalic,
        ),
        const Gap(4),
        SizedBox.square(
          dimension: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isRestaurantOpen //
                  ? const Color(0xff5CD313)
                  : const Color(0xffEA5E5E),
            ),
          ),
        ),
      ],
    );
  }
}
