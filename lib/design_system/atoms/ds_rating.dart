import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DsRating extends StatelessWidget {
  const DsRating({
    super.key,
    required this.initialRating,
    required this.itemCount,
    this.onRatingUpdate,
    this.minRating,
    this.itemSize,
    this.gapHorizontal,
    this.icon,
    this.iconColor,
  });

  final double initialRating;
  final int itemCount;
  final Function(double value)? onRatingUpdate;
  final double? minRating;
  final double? itemSize;
  final double? gapHorizontal;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: minRating ?? 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: itemCount,
      itemSize: itemSize ?? 16,
      itemPadding: EdgeInsets.symmetric(horizontal: gapHorizontal ?? 2),
      itemBuilder: (context, index) => Icon(
        icon ?? Icons.star,
        color: iconColor ?? Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate ?? (value) => print(value),
    );
  }
}
