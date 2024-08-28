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
    final ImageProvider image = switch (restaurant.photos?.firstOrNull) {
      final url? => NetworkImage(url),
      null => const AssetImage('assets/images/no_restaurant_image.jpg'),
    };

    final box = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
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
