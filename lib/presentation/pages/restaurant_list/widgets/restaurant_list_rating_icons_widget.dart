import 'package:flutter/material.dart';

class RestaurantListRatingIconsWidget extends StatelessWidget {
  final int rating;

  const RestaurantListRatingIconsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rating,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 12,
          );
        },
      ),
    );
  }
}
