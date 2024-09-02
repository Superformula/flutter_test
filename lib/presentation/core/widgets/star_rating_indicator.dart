import 'package:flutter/material.dart';

class StarRatingIndicator extends StatelessWidget {
  final double rating;

  const StarRatingIndicator({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < rating ? Colors.yellow : Colors.grey,
          size: 12,
        ),
      ),
    );
  }
}
