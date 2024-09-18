import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:restaurant_tour/view/pages/restaurant_page.dart';
import 'package:restaurant_tour/view/widgets/favorite_list_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_list_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    GetIt.I.get<RestaurantsBloc>().add(LoadRestaurants());
    GetIt.I.get<FavoritesRestaurantsBloc>().add(LoadFavoritesRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Restaurants',
            ),
            Tab(text: 'Favorites'),
          ]),
        ),
        body: const TabBarView(children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: RestaurantListWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: FavoriteListWidget(),
          ),
        ]),
      ),
    );
  }
}
