import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/design_system/design_system.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          DsImageNetwork(
            urlImage: restaurant.heroImage,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DsText(
                  restaurant.name ?? 'No name',
                  textVariant: TextVariant.subTitle,
                  isBold: true,
                  fontFamily: AppFonts.secundary,
                ),
                const SizedBox(height: DsSizes.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DsText(
                          restaurant.price ?? '---',
                        ),
                        DsRating(
                          initialRating: restaurant.rating ?? 0,
                          itemCount: 5,
                        ),
                      ],
                    ),
                    StatusOpen(isOpenNow: restaurant.isOpen),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
