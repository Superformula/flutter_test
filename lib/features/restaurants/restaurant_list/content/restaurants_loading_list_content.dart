import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class RestaurantsLoadingListContent extends StatelessWidget {
  const RestaurantsLoadingListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ShimmerRestaurantListItemWidget();
      },
    );
  }
}
