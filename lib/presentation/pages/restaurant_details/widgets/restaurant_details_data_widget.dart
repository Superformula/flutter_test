import 'package:flutter/material.dart';
import '../../../../core/config/strings.dart';
import '../../../../models/restaurant.dart';
import '../../../../typography.dart';

class RestaurantDetailsDataWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsDataWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.price ?? '\$\$',
                style: AppTextStyles.openRegularText,
              ),
              const SizedBox(
                width: 10,
              ),
              // Category
              Text(
                restaurant.displayCategory,
                style: AppTextStyles.openRegularText,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                children: [
                  restaurant.isOpen
                      ? const Text(AppStrings.restaurantOpen)
                      : const Text(AppStrings.restaurantClosed),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: restaurant.isOpen ? Colors.green : Colors.red,
                    size: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
        // Address
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            AppStrings.restaurantDetailLocation,
            style: AppTextStyles.openRegularText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Text(
            restaurant.location!.formattedAddress!,
            style: AppTextStyles.loraRegularTitle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
        // Overall Rating
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            AppStrings.restaurantDetailRating,
            style: AppTextStyles.openRegularText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                restaurant.rating.toString(),
                style: AppTextStyles.loraRegularHeadline,
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 12,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            '${restaurant.reviews?.length  ?? 0} Reviews',
            style: AppTextStyles.openRegularText,
          ),
        ),
      ],
    );
  }
}
