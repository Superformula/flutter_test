import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/restaurants_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRestaurantsView extends StatefulWidget {
  const FavoriteRestaurantsView({super.key});

  @override
  State<FavoriteRestaurantsView> createState() =>
      _FavoriteRestaurantsViewState();
}

class _FavoriteRestaurantsViewState extends State<FavoriteRestaurantsView> {
  List<Restaurant> _favoriteRestaurants = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Widget _emptyFavoritesView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: 60,
            color: Colors.black,
          ),
          Text(
            sorryText,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            noFavoriteRestaurantsText,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadFavorites() async {
    final favoriteRestaurants = await SharedPreferences.getInstance();
    final keys = favoriteRestaurants.getKeys();
    var accumulatedFavorites = <Restaurant>[];

    for (var key in keys) {
      final isFavorite = favoriteRestaurants.getBool(key) ?? false;

      if (isFavorite) {
        var favoriteRestaurant =
            RestaurantsRepository.getFavoriteRestaurants(key);
        accumulatedFavorites.addAll(favoriteRestaurant);
      }
    }

    setState(() {
      _favoriteRestaurants = accumulatedFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _favoriteRestaurants.isNotEmpty
        ? ListView.builder(
            itemCount: _favoriteRestaurants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RestaurantCard(
                  restaurant: _favoriteRestaurants[index],
                ),
              );
            },
          )
        : _emptyFavoritesView();
  }
}
