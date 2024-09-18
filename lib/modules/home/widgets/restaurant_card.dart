import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/design_system.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(8),
      child: const Row(
        children: [
          DsImageNetwork(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DsText(
                  'Restauran Name',
                  textVariant: TextVariant.subTitle,
                  isBold: true,
                  fontFamily: AppFonts.secundary,
                ),
                SizedBox(height: DsSizes.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DsText(
                          '\$500 Italian',
                        ),
                        DsRating(
                          initialRating: 4,
                          itemCount: 5,
                        ),
                      ],
                    ),
                    StatusOpen(isOpenNow: true),
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
