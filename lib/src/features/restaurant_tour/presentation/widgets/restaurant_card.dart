import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_image.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_info.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: RestaurantCardImage(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: RestaurantCardInfo(),
          ),
        ],
      ),
    );
  }
}
