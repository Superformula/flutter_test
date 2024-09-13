import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class RestaurantInformationWidget extends StatelessWidget {
  const RestaurantInformationWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Hero(
            tag: restaurant.id!,
            child: CachedNetworkImage(
              imageUrl: restaurant.heroImage,
              height: 361,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: restaurant.price ?? '\$',
                            ),
                            TextSpan(
                              text: ' ${restaurant.displayCategory}',
                            ),
                          ],
                        ),
                      ),
                      RestaurantAvailableStatusWidget(
                        isOpen: restaurant.isOpen,
                      ),
                    ],
                  ),
                ),
                const DetailDivider(),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 121,
                  child: Text(
                    restaurant.location?.formattedAddress ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const DetailDivider(),
                Text(
                  'Overall Rating',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      (restaurant.rating ?? 0).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 28),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const StartRatingWidget(rating: 1),
                  ],
                ),
                const DetailDivider(),
                Text(
                  '${restaurant.reviews?.length ?? 0} Reviews',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
