import 'package:flutter/widgets.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/ui/colors.dart';
import 'package:restaurant_tour/ui/typography.dart';

final class RestaurantHourStatus extends StatelessWidget {
  const RestaurantHourStatus({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          restaurant.open ? 'Open Now' : 'Closed',
          style: AppTextStyles.openOverline,
        ),
        const SizedBox(width: 8.0),
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: restaurant.open ? Colors.openGreen : Colors.closedRed,
          ),
          child: const SizedBox.square(dimension: 8.0),
        ),
      ],
    );
  }
}
