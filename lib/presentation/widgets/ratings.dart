import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key, required this.rating});

  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        rating.round(),
        (index) => const Icon(
          Icons.star,
          color: Colors.amber,
          size: 16,
        ),
      ),
    );
  }
}
