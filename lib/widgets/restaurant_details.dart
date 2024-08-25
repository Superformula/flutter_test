import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class PriceAndClassificationRowWidget extends StatelessWidget {
  const PriceAndClassificationRowWidget({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          restaurant.price ?? '-',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          width: 6,
        ),
        Flexible(
          child: Text(
            restaurant.categories?.map((element) => element.title).first ?? '',
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
