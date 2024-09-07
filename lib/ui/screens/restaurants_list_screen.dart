import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';

final class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final star = SvgPicture.asset('assets/svg/star.svg');

    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox.square(
              dimension: 88,
              child: ColoredBox(color: Colors.red),
            ),
            const Gap(12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (restaurant.name case final name?) Text(name),
                  const Gap(4),
                  Row(
                    children: [
                      if (restaurant.price case final price?) Text(price),
                      //Text(restaurant.displayCategory),
                      const Gap(4),
                      const Text('Italian'),
                    ],
                  ),
                  const Gap(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (restaurant.rating case final rating?)
                        Row(
                          children: [
                            for (int counter = 0; counter < rating.toInt(); counter = counter + 1) star,
                          ],
                        ),
                      Row(
                        children: [
                          Text(restaurant.isOpen ? 'Open Now' : 'Closed'),
                          const Gap(8),
                          SizedBox.square(
                            dimension: 8,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: restaurant.isOpen //
                                    ? const Color(0xff5CD313)
                                    : const Color(0xffEA5E5E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class RestaurantsList extends StatelessWidget {
  const RestaurantsList({
    super.key,
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantCard(restaurant: restaurants[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Gap(12),
    );
  }
}
