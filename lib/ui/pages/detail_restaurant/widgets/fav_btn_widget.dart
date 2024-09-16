import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

class FavoriteBtnWidget extends StatelessWidget {
  final RestaurantEntity restaurant;

  const FavoriteBtnWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavoriteRestaurant = favoritesProvider.isFavorite(restaurant.id);
        return IconButton(
          onPressed: () {
            favoritesProvider.toggleFavorite(restaurant);
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: isFavoriteRestaurant
                ? const Icon(
                    Icons.favorite,
                    color: OsColors.secondaryColor,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: OsColors.secondaryColor,
                  ),
          ),
        );
      },
    );
  }
}
