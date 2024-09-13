import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_info_page.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_image.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card_info.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantInfoPage(
              restaurant: restaurant,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: RestaurantCardImage(
                restaurant: restaurant,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RestaurantCardInfo(
                restaurant: restaurant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
