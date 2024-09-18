import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/view/pages/restaurant_page.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class FavoriteListWidget extends StatefulWidget {
  const FavoriteListWidget({super.key});

  @override
  State<FavoriteListWidget> createState() => _FavoriteListWidgetState();
}

class _FavoriteListWidgetState extends State<FavoriteListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesRestaurantsBloc, FavoritesRestaurantsState>(
      bloc: GetIt.I.get<FavoritesRestaurantsBloc>(),
      builder: (context, state) {
        if (state is FavoritesRestaurantsReady) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 2,
            ),
            itemCount: state.favoritesRestaurants.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<RestaurantPage>(
                    builder: (context) => RestaurantPage(
                      restaurant: state.favoritesRestaurants[index],
                    ),
                  ),
                ),
                child: RestaurantTile(
                  restaurant: state.favoritesRestaurants[index],
                ),
              );
            },
          );
        }
        if (state is FavoriteRestaurantsListError) {
          return Center(
            child: Text(state.exception.description),
          );
        }

        if (state is FavoritesRestaurantsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
