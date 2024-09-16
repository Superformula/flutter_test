import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/home_screen/presenter/page/widgets/card_restaurant/restaurant_card_skeleton.dart';

class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    const int itemCount = 6;

    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return const RestaurantCardSkeleton();
        },
      ),
    );
  }
}
