import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/components/rating_stars.dart';

import 'package:restaurant_tour/core/theme/typography.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final void Function() onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  String get openStatusLabel => restaurant.isOpen ? "Open Now" : "Closed";
  Color get openStatusColor =>
      restaurant.isOpen ? const Color(0xFF5CD313) : const Color(0xFFEA5E5E);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 88,
                    height: 88,
                    child: Image.network(
                      restaurant.heroImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name!,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.loraRegularTitle,
                      ),
                      const Spacer(),
                      Text(
                        "${restaurant.price!} ${restaurant.displayCategory} ",
                        style: AppTextStyles.openRegularText,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStars(rating: restaurant.rating!),
                          const Spacer(),
                          Text(
                            openStatusLabel,
                            style: AppTextStyles.openRegularItalic,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: openStatusColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
