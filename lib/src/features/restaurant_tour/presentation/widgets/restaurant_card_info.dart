import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/constants/typography.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';

class RestaurantCardInfo extends StatelessWidget {
  const RestaurantCardInfo({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 235,
          child: Text(
            restaurant.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.loraRegularTitle,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${restaurant.price} ${restaurant.categories![0].title}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.openRegularText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              restaurant.rating!.round(),
              (index) => const StarIcon(),
            ),
            const Spacer(),
            SizedBox(
              child: Text(
                restaurant.isOpen ? openNowText : closedText,
                style: AppTextStyles.openRegularItalic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.circle,
                color: restaurant.isOpen ? Colors.green : Colors.red,
                size: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
