import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/restaurant_provider.dart';
import '../widgets/restaurant_list_card_widget.dart';

class RestaurantListFavoritesRestaurantsWidget extends ConsumerWidget {
  const RestaurantListFavoritesRestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(favoritesListProvider);

    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantListCardWidget(restaurant: restaurant);
      },
    );
  }
}
