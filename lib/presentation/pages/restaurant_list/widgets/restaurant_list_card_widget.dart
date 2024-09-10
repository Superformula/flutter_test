import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

import '../../../../core/config/strings.dart';
import '../../../../core/utils/router_manager.dart';
import '../../../../typography.dart';
import 'restaurant_list_categories_widget.dart';
import 'restaurant_list_rating_icons_widget.dart';

class RestaurantListCardWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListCardWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: SizedBox(
            height: 88,
            width: 88,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.restaurantDetails,
                  arguments: restaurant,
                );
              },
              child: Hero(
                tag: restaurant.id ?? 'heroImage',
                child: Image.network(
                  restaurant.heroImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          title: Text(
            restaurant.name ?? 'Unknown Restaurant',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.loraRegularTitle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Price
                  Text(restaurant.price!),
                  const SizedBox(
                    width: 10,
                  ),
                  // Category
                  RestaurantListCategoriesWidget(
                    categories: restaurant.categories ?? [],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rating
                  RestaurantListRatingIconsWidget(rating: (restaurant.rating ?? 0).round()),
                  // Open/Closed
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
