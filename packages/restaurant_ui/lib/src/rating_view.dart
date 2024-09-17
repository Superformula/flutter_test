import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({required this.rating, super.key});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final stars = rating.truncate();
    return SizedBox(
      height: 20,
      child: Row(
        children: List.filled(
          stars,
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
