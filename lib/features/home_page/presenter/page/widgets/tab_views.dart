import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/all_restaurants_tab.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/my_favorites_tab.dart';

class TabViews extends StatelessWidget {
  const TabViews({
    super.key,
    required this.restaurantList,
  });

  final List<Restaurant> restaurantList;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          child: TabBarView(
            children: [
              AllRestaurantsTab(),
              MyFavoritesTab(),
            ],
          ),
        ),
      ],
    );
  }
}
