import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/aplication/yelp/yelp_bloc.dart';
import 'package:restaurant_tour/presentation/pages/home/widgets/restaurant_card_widget.dart';
import 'package:restaurant_tour/presentation/routes/router.gr.dart';

class FavoriteRestaurantsWidget extends StatelessWidget {
  const FavoriteRestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YelpBloc, YelpState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isGettingData) {
          return const Center(child: CircularProgressIndicator());
        }

        final restaurants = state.favoriteRestaurants;
        if (restaurants.isEmpty) {
          return const Center(child: Text("No favorite restaurants available"));
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCardWidget(
                imageUrl: restaurant.heroImage,
                title: restaurant.name ?? 'Unknown Restaurant',
                subtitle:
                    "${restaurant.price ?? ''} ${restaurant.displayCategory}",
                rating: restaurant.rating ?? 0,
                isOpen: restaurant.isOpen,
                onTap: () => context.router.push(RestaurantDetailsRoute(
                    restaurant: restaurant,
                    yelpBloc: context.read<YelpBloc>())),
              );
            },
          ),
        );
      },
    );
  }
}
