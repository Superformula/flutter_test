import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/all_restaurant/presenter/page/all_restaurants_tab.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/presenter/page/favorite_restaurants_tab.dart';

class TabViews extends StatelessWidget {
  const TabViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: TabBarView(
        children: [
          AllRestaurantsTab(),
          FavoriteRestaurantsTab(),
        ],
      ),
    );
  }
}
