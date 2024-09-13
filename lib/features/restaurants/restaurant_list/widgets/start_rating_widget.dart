import 'package:flutter/material.dart';

class StartRatingWidget extends StatelessWidget {
  const StartRatingWidget({required this.rating, super.key});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating, (index) {
        return const Icon(
          Icons.star,
          color: Color(0xFFFFB800),
          size: 12,
        );
      }),
    );
  }
}
