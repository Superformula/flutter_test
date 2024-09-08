import 'package:flutter/material.dart';
import 'package:restaurant_tour/controllers/favorite_restaurant_view_controller.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:restaurant_tour/typography.dart';

import 'restaurants_favorites_screen.dart';
import 'restaurants_list_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.restaurantViewController,
    required this.favoriteRestaurantViewController,
  });

  final RestaurantViewController restaurantViewController;
  final FavoriteRestaurantViewController favoriteRestaurantViewController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final restaurantViewController = widget.restaurantViewController;
  late final favoriteRestaurantViewController = widget.favoriteRestaurantViewController;

  Future<void> seletcRestaurantAsFavorite(RestaurantData restaurant, bool isFavorite) async {
    await favoriteRestaurantViewController.favoritateRestaurant(
      offset: restaurantViewController.offset,
      restaurantId: restaurant.id,
      isFavorite: isFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 4,
            shadowColor: const Color(0xff000033),
            title: const Text(
              'RestauranTour',
              style: AppTextStyles.loraRegularHeadline,
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: DefaultTextStyle(
                style: AppTextStyles.openRegularTitleSemiBold,
                child: TabBar(
                  labelPadding: EdgeInsets.all(8),
                  tabAlignment: TabAlignment.center,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Text('All Restaurants'),
                    Text('My Favorites'),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                RestaurantsListScreen(
                  viewController: restaurantViewController,
                  onSelectFavorite: seletcRestaurantAsFavorite,
                  onLoadSingleFavorite: favoriteRestaurantViewController.getSingleFavoriteRestaurant,
                ),
                FavoriteRestaurantsScreen(
                  viewController: favoriteRestaurantViewController,
                  onSelectFavorite: seletcRestaurantAsFavorite,
                  onLoadSingleFavorite: favoriteRestaurantViewController.getSingleFavoriteRestaurant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
