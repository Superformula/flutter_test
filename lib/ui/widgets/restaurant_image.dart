import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

final class RestaurantImage extends StatelessWidget {
  const RestaurantImage({
    super.key,
    required this.restaurant,
    this.borderRadius,
    this.heroTag,
  });

  final Object? heroTag;
  final Restaurant restaurant;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = restaurant.photos?.firstOrNull ?? 'https://t4.ftcdn.net/jpg/05/17/53/57/360_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg';

    final box = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
    );

    if (heroTag case final tag?) {
      return Hero(
        tag: tag,
        child: box,
      );
    } else {
      return box;
    }
  }
}
