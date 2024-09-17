import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantListBloc, RestaurantListState>(
      listener: (context, state) {
        // TODO: do stuff here based on RestaurantListBloc state
      },
      builder: (context, state) {
        final state = context.select((RestaurantListBloc bloc) => bloc.state);
        if (state is RestaurantListLoading) {
          return const CircularProgressIndicator();
        }
        if (state is RestaurantListError) {
          return const Text('error');
        }
        if (state is RestaurantListData) {
          final restaurants = state.restaurants;
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCard(
                title: restaurant.name ?? '',
                photoUrl: restaurant.heroImage,
                isOpen: restaurant.isOpen,
                price: restaurant.price ?? '',
                rating: restaurant.rating ?? 0.0,
                categories: (restaurant.categories ?? [])
                    .map((category) => category.title ?? '')
                    .toList(),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
