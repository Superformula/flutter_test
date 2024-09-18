import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/core/routes.dart';
import 'package:restaurant_tour/modules/home/widgets/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    super.key,
    required this.loading,
    required this.restaurants,
  });

  final bool loading;
  final List<Restaurant> restaurants;

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
          onTap: () => Navigator.of(context).pushNamed(
            RoutePaths.restaurantDetail,
          ),
          child: RestaurantCard(
            restaurant: currentRestaurant,
          ),
        );
      },
    );
  }
}
