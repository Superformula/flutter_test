import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      starSize: 12.0,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      value: value,
      starColor: const Color(0xffFFB800),
      starOffColor: Colors.transparent,
    );
  }
}
