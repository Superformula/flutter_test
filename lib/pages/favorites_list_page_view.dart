import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/pages/restaurant_list_page.dart';

class FavoritesListPageView extends StatelessWidget {
  const FavoritesListPageView({super.key});
  // final List<Restaurant> restaurants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        if (state is LoadingRestaurantsState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RestaurantsLoadedState ||
            state is FavoriteRestaurantState) {
          return LayoutBuilder(
            builder: (context, constraints) {
              List<Restaurant> favoritesList = state.result!.restaurants!
                  .where(
                    (element) => state.favoriteRestaurants.contains(element.id),
                  )
                  .toList();
              return ListView.builder(
                itemCount: favoritesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RestaurantListTile(
                        restaurant: favoritesList.elementAt(index),
                        constraints: constraints,
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
        return Container();
      },
    ));
  }
}
