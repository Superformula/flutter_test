import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/app/cubits/cubits.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return state is FavoriteLoaded
            ? state.restaurants.isEmpty
                ? const Center(child: Text('No favorites'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: state.restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = state.restaurants[index];
                      return RestaurantListItemWidget(restaurant: restaurant);
                    },
                  )
            : const Center(child: Text('Failed to load favorites'));
      },
    );
  }
}
