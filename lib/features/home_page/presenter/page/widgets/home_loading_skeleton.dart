import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/restaurant_card_skeleton.dart';

class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RestaurantCardSkeleton(),
        RestaurantCardSkeleton(),
        RestaurantCardSkeleton(),
        RestaurantCardSkeleton(),
      ],
    );
  }
}
