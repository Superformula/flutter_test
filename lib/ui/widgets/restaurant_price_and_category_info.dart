import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/ui/typography.dart';

final class RestaurantPriceAndCategoryInfo extends StatelessWidget {
  const RestaurantPriceAndCategoryInfo({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final priceAndCategoryLine = [
      restaurant.price,
      restaurant.mainCategory?.title,
    ].whereNotNull().join(' ');

    return Text(
      priceAndCategoryLine,
      maxLines: 1,
      style: AppTextStyles.openCaption,
    );
  }
}
