import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

import 'package:restaurant_tour/presentation/components/restaurant_card.dart';


class FavoriteRestaurantsTab extends StatelessWidget {
  final List<Restaurant> restaurants;
  final void Function(Restaurant restaurant, bool isFavorite) onTapRestaurant;

  const FavoriteRestaurantsTab({
    super.key,
    required this.restaurants,
    required this.onTapRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) {
      return const Center(
        child: Text("No favorites restaurants"),
      );
    }

    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantCard(
          restaurant: restaurant,
          onTap: () => onTapRestaurant(restaurant, true),
        );
      },
    );
  }
}
