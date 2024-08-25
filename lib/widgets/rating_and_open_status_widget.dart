import 'package:flutter/widgets.dart';

import '../models/restaurant.dart';
import 'rating_widget.dart';
import 'widgets.dart';

class RatingAndOpenStatusWidget extends StatelessWidget {
  const RatingAndOpenStatusWidget({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(
          rating: restaurant.rating?.round() ?? 0,
        ),
        const Spacer(),
        OpenStatusWidget(
          isOpen: restaurant.isOpen,
        )
      ],
    );
  }
}
