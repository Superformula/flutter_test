import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class RestaurantCardImage extends StatelessWidget {
  const RestaurantCardImage({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        restaurant.heroImage,
        height: 120.0,
        width: 120.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
