import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({required this.rating, super.key});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final stars = rating.truncate();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.filled(
        stars,
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
      ),
    );
  }
}
