import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/ui/pages/home/widgets/card_item.dart';
import 'package:restaurant_tour/ui/ui.dart';

class FavoritesRestaurantsPage extends StatelessWidget {
  const FavoritesRestaurantsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsColors.bgColor,
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favoriteRestaurant = favoritesProvider.favoriteRestaurants;

          if (favoriteRestaurant.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppConstants.noFavoriteRestaurants, style: AppTextStyles.openRegularText),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite_outline_outlined),
                  ),
                ],
              ),
            );
          }
          return CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: favoriteRestaurant.length,
                  (context, index) {
                    final restaurant = favoriteRestaurant[index];
                    bool isOpenNow = false;
                    if (restaurant.hours.isNotEmpty) {
                      isOpenNow = restaurant.hours.first.isOpenNow;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: CardItem(
                        restaurant: restaurant,
                        isRestaurantOpen: isOpenNow,
                      ),
                    );
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16.0)),
            ],
          );
        },
      ),
    );
  }
}
