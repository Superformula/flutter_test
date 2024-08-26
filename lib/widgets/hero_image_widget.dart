import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class HeroImageWidget extends StatelessWidget {
  const HeroImageWidget(
      {super.key,
      required this.restaurant,
      this.borderRadius = 0,
      required this.width,
      required this.height});
  final Restaurant restaurant;
  final double borderRadius;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: restaurant.id.toString(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: restaurant.heroImage.isNotEmpty &&
                Uri.tryParse(restaurant.heroImage)?.isAbsolute == true
            ? Image.network(
                restaurant.heroImage,
                fit: BoxFit.cover,
                width: width,
                height: height,
              )
            : Container(
                width: width,
                height: height,
                color: const Color.fromARGB(255, 197, 233, 199),
                child: Image.asset(
                  'assets/placeholder.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
      ),
    );
  }
}
