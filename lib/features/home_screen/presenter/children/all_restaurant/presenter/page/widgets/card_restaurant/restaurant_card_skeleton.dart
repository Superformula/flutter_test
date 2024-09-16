import 'package:flutter/material.dart';
import 'package:restaurant_tour/shared/rt_skeleton.dart';

class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        child: RtSkeleton(
          height: 120,
          width: MediaQuery.sizeOf(context).width * 0.95,
        ),
      ),
    );
  }
}
