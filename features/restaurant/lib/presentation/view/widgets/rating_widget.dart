import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class RatingWidget extends StatelessWidget {
  final double rate;
  const RatingWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 80,
      child: ListView.builder(
        itemCount: rate.toInt(),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: AppColors.star,
          size: 16,
        ),
      ),
    );
  }
}
