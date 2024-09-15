import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/pages/favorites_page.dart';
import 'package:restaurant_tour/presentation/pages/restaurants_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant Tour'),
          bottom: TabBar(
            overlayColor: WidgetStateProperty.all(Colors.red[200]),
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                text: 'All Restaurants',
              ),
              Tab(text: 'My Favorites'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantsPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
