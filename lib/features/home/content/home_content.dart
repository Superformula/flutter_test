import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/favorites/screen/favorites_screen.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/screen/restaurant_list_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Restaurants'),
              Tab(text: 'My Favorites'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [RestaurantListScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}
