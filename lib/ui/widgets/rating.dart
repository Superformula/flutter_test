import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    this.count = 1,
    this.size,
  });

  final int count;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final star = SvgPicture.asset(
      'assets/svg/star.svg',
      width: size?.width,
      height: size?.height,
    );

    if (count == 1) {
      return star;
    } else {
      return Row(
        children: [
          for (int counter = 0; counter < count; counter = counter + 1) star,
        ],
      );
    }
  }
}
