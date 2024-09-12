import 'dart:async';

import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/theme/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/screens/home/all_restaurants_tab.dart';
import 'package:restaurant_tour/presentation/screens/home/favorite_restaurants_tab.dart';

class HomeScreen extends StatefulWidget {
  final GetRestaurantsUseCase getAllRestaurantsUseCase;
  final GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final void Function(Restaurant restaurant, bool isFavorite) onTapRestaurant;

  const HomeScreen({
    super.key,
    required this.getAllRestaurantsUseCase,
    required this.getFavoriteRestaurantsUseCase,
    required this.toggleFavoriteUseCase,
    required this.onTapRestaurant,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final StreamSubscription<List<Restaurant>> _favoritesSubscription;
  List<Restaurant> favoriteRestaurants = [];

  @override
  void initState() {
    super.initState();
    _favoritesSubscription =
        widget.getFavoriteRestaurantsUseCase().listen((data) {
      setState(() {
        favoriteRestaurants = data;
      });
    });
  }

  @override
  void dispose() {
    _favoritesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "RestauranTour",
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: const TabBar(
            labelStyle: AppTextStyles.openRegularTitleSemiBold,
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xFF606060),
            indicatorColor: Colors.black,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            tabs: [
              Tab(
                text: "All Restaurants",
              ),
              Tab(
                text: "My Favorites",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: TabBarView(
            children: [
              AllRestaurantsTab(
                getAllRestaurantsUseCase: widget.getAllRestaurantsUseCase,
                toggleFavoriteUseCase: widget.toggleFavoriteUseCase,
                favoriteRestaurants: favoriteRestaurants,
                onTapRestaurant: (restaurant, isFavorite) =>
                    widget.onTapRestaurant(restaurant, isFavorite),
              ),
              FavoriteRestaurantsTab(
                restaurants: favoriteRestaurants,
                onTapRestaurant: (restaurant, isFavorite) =>
                    widget.onTapRestaurant(restaurant, isFavorite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
