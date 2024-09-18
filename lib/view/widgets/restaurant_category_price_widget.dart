import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RestaurantCategoryPriceWidget extends StatelessWidget {
  const RestaurantCategoryPriceWidget(
      {required this.price, required this.category, super.key});
  final String? price;
  final String? category;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price ?? "\$\$",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(4),
        Text(
          category ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
