import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/restaurants_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_info_page.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';
import 'package:restaurant_tour/typography.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.restaurant,
            size: 60,
            color: Colors.black,
          ),
          Text(
            sorryText,
            style: AppTextStyles.openRegularTitleSemiBold.copyWith(
              fontSize: 30,
            ),
          ),
          Text(
            noFavoriteRestaurantsText,
            style: AppTextStyles.openRegularText.copyWith(
              fontSize: 20,
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

  Future<void> _onNavigateToRestaurantInfoPage(Restaurant restaurant) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantInfoPage(restaurant: restaurant),
      ),
    );

    if (result == true) {
      _loadFavorites();
    }
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
                  onTap: () => _onNavigateToRestaurantInfoPage(
                    _favoriteRestaurants[index],
                  ),
                ),
              );
            },
          )
        : _emptyFavoritesView();
  }
}
