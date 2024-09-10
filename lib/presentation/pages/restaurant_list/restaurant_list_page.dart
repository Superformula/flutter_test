import 'package:flutter/material.dart';
import '../../../core/config/strings.dart';
import 'tabs/restaurant_list_all_restaurants_tab.dart';
import 'tabs/restaurant_list_favorites_restaurants_tab.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text(AppStrings.restaurantAllTab),),
              Tab(icon: Text(AppStrings.restaurantFavTab),),
            ],
          ),
          centerTitle: true,
          title: const Text(
            AppStrings.restaurantListTitle,
            style: TextStyle(
              fontFamily: 'Lora',
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantListAllRestaurantsWidget(),
            RestaurantListFavoritesRestaurantsWidget(),
          ],
        ),
      ),
    );
  }
}
