import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/restaurant_provider.dart';
import '../widgets/restaurant_list_card_widget.dart';

class RestaurantListAllRestaurantsWidget extends ConsumerWidget {
  const RestaurantListAllRestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantAsyncValue = ref.watch(restaurantListProvider);

    return restaurantAsyncValue.when(
      data: (restaurants) {
        if (restaurants.isEmpty) {
          return const Center(child: Text('No restaurants found.'));
        }
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return RestaurantListCardWidget(restaurant: restaurant);
          },
        );
      },
      loading: () => const Center(
          child: CircularProgressIndicator(),), // Show a loading spinner
      error: (error, stack) =>
          Center(child: Text('Error: $error')), // Handle errors
    );
  }
}
