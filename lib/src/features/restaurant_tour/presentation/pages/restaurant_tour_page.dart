import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/all_restaurants_view.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/favorite_restaurants_view.dart';

class RestaurantTourPage extends StatefulWidget {
  const RestaurantTourPage({super.key});

  @override
  State<RestaurantTourPage> createState() => _RestaurantTourPageState();
}

class _RestaurantTourPageState extends State<RestaurantTourPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(titleApp),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(allRestaurants),
              ),
              Tab(
                child: Text(myFavorites),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllRestaurantsView(),
            FavoriteRestaurantsView(),
          ],
        ),
      ),
    );
  }
}
