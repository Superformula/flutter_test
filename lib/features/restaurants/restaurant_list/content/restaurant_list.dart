import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({
    required this.restaurantsStateLoaded,
    super.key,
  });

  final RestaurantListLoaded restaurantsStateLoaded;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RestaurantListCubit>().getRestaurants();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: restaurantsStateLoaded.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantsStateLoaded.restaurants[index];
          return RestaurantListItemWidget(restaurant: restaurant);
        },
      ),
    );
  }
}
