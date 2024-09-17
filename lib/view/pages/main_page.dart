import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:restaurant_tour/view/pages/restaurant_page.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    GetIt.I.get<RestaurantsBloc>().add(LoadRestaurants());
    GetIt.I.get<FavoritesRestaurantsBloc>().add(LoadFavoritesRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Restaurants',
            ),
            Tab(text: 'Favorites'),
          ]),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: _buildRestaurantList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: _buildFavoritesRestaurantsList(),
          ),
        ]),
      ),
    );
  }
}

Widget _buildRestaurantList() {
  return BlocBuilder<RestaurantsBloc, RestaurantsState>(
    bloc: GetIt.I.get<RestaurantsBloc>(),
    builder: (context, state) {
      if (state is RestaurantsReady) {
        return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                ),
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<RestaurantPage>(
                          builder: (context) => RestaurantPage(
                            restaurant: state.restaurants[index],
                          ),
                        ),
                      ),
                  child: RestaurantTile(restaurant: state.restaurants[index]));
            });
      }
      if (state is RestaurantsError) {
        return Center(
          child: Text(state.exception.description),
        );
      }

      if (state is RestaurantsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    },
  );
}

Widget _buildFavoritesRestaurantsList() {
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
                    restaurant: state.favoritesRestaurants[index]),
              );
            });
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
