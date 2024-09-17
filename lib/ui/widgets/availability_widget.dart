import 'package:flutter/material.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

/// Row widget with availability status and colored status circle
class AvailabilityWidget extends StatelessWidget {
  final bool isRestaurantOpen;
  const AvailabilityWidget({super.key, required this.isRestaurantOpen});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isRestaurantOpen ? AppConstants.openNow : AppConstants.closed,
          style: AppTextStyles.openRegularItalic,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 2, 0),
          child: SizedBox.square(
            dimension: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRestaurantOpen ? OsColors.statusSuccess : OsColors.statusError,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
