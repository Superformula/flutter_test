import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/theme/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/screens/home/_tabs/all_restaurants_tab/all_restaurants_tab.dart';
import 'package:restaurant_tour/presentation/screens/home/_tabs/favorite_restaurants_tab/favorite_restaurants_tab.dart';
import 'package:restaurant_tour/presentation/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  final GetRestaurantsUseCase getAllRestaurantsUseCase;
  final GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final void Function(Restaurant restaurant, bool isFavorite) onTapRestaurant;

  const HomeScreen({
    super.key,
    required this.getAllRestaurantsUseCase,
    required this.getFavoriteRestaurantsUseCase,
    required this.toggleFavoriteUseCase,
    required this.onTapRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getFavoriteRestaurantsUseCase: getFavoriteRestaurantsUseCase,
      )..add(const LoadFavoriteRestaurants()),
      child: Builder(
        builder: (context) {
          return DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "RestauranTour",
                  style: AppTextStyles.loraRegularHeadline,
                ),
                bottom: const TabBar(
                  labelStyle: AppTextStyles.openRegularTitleSemiBold,
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFF606060),
                  indicatorColor: Colors.black,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      text: "All Restaurants",
                    ),
                    Tab(
                      text: "My Favorites",
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return TabBarView(
                      children: [
                        AllRestaurantsTab(
                          getAllRestaurantsUseCase: getAllRestaurantsUseCase,
                          toggleFavoriteUseCase: toggleFavoriteUseCase,
                          favoriteRestaurants: state.favoriteRestaurants,
                          onTapRestaurant: (restaurant, isFavorite) =>
                              onTapRestaurant(restaurant, isFavorite),
                        ),
                        FavoriteRestaurantsTab(
                          restaurants: state.favoriteRestaurants,
                          onTapRestaurant: (restaurant, isFavorite) =>
                              onTapRestaurant(restaurant, isFavorite),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
