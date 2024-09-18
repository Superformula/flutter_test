import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/modules/home/widgets/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    super.key,
    required this.loading,
    required this.restaurants,
    required this.onSelected,
  });

  final bool loading;
  final List<Restaurant> restaurants;
  final Function(Restaurant restaurant) onSelected;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final currentRestaurant = restaurants[index];
        return InkWell(
          onTap: () => onSelected(currentRestaurant),
          child: RestaurantCard(
            restaurant: currentRestaurant,
          ),
        );
      },
    );
  }
}
