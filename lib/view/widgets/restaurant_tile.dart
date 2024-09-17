import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/pages/restaurant_page.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({required this.restaurant, super.key});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: restaurant.id ?? 'restaurant_id',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      width: 88,
                      height: 88,
                      restaurant.photos?.first ??
                          'https://picsum.photos/200/300'),
                ),
              ),
              const Gap(12),
              Expanded(
                child: SizedBox(
                  height: 88,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name ?? 'Restaurant Name',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            restaurant.price ?? "\$\$",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Gap(4),
                          Text(
                            restaurant.categories?.first.title ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RestaurantStarRating(restaurant.rating?.toInt() ?? 2),
                          RestaurantOpen(restaurant.isOpen)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
