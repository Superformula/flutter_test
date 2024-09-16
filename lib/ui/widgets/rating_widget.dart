import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Widget to display the number of star ratings
class RatingWidget extends StatelessWidget {
  final int rating;
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating, (index) {
        return SvgPicture.asset(
          'assets/images/star.svg',
          width: 12,
          height: 12,
        );
      }),
    );
  }
}
