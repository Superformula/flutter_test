import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

final class RestaurantImage extends StatelessWidget {
  const RestaurantImage({
    super.key,
    required this.restaurant,
    this.borderRadius,
  });

  final Restaurant restaurant;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = restaurant.photos?.firstOrNull ?? 'https://t4.ftcdn.net/jpg/05/17/53/57/360_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg';

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
    );
  }
}
