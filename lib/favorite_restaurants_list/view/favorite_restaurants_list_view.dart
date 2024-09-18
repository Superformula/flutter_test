import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class FavoriteRestaurantsListView extends StatelessWidget {
  const FavoriteRestaurantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteRestaurantsBloc, FavoriteRestaurantsState>(
      builder: (context, state) {
        final state =
            context.select((FavoriteRestaurantsBloc bloc) => bloc.state);
        if (state is FavoriteRestaurantsLoading) {
          return const CircularProgressIndicator();
        }
        if (state is FavoriteRestaurantsError) {
          return const Text('error');
        }
        if (state is FavoriteRestaurantsData) {
          final restaurants = state.restaurants;
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCard(
                tag: restaurant.id ?? '',
                title: restaurant.name ?? '',
                photoUrl: restaurant.heroImage,
                isOpen: restaurant.isOpen,
                price: restaurant.price ?? '',
                rating: restaurant.rating ?? 0.0,
                category: restaurant.displayCategory,
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
