import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';
import 'package:restaurant_tour/presentation/screens/home/_tabs/all_restaurants_tab/bloc/all_restaurants_tab_bloc.dart';

typedef OnTapRestaurant = void Function(Restaurant restaurant, bool isFavorite);

// I'm just using StatefulWidget here to implement
// AutomaticKeepAliveClientMixin and keep the state of the tab when changing tabs
class AllRestaurantsTab extends StatefulWidget {
  final GetRestaurantsUseCase getAllRestaurantsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final List<Restaurant> favoriteRestaurants;
  final OnTapRestaurant onTapRestaurant;

  const AllRestaurantsTab({
    super.key,
    required this.getAllRestaurantsUseCase,
    required this.toggleFavoriteUseCase,
    required this.favoriteRestaurants,
    required this.onTapRestaurant,
  });

  @override
  State<AllRestaurantsTab> createState() => _AllRestaurantsTabState();
}

class _AllRestaurantsTabState extends State<AllRestaurantsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => AllRestaurantsTabBloc(
        getRestaurantsUseCase: widget.getAllRestaurantsUseCase,
      )..add(const LoadAllRestaurants()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<AllRestaurantsTabBloc, AllRestaurantsTabState>(
            builder: (context, state) {
              if (state.contentIsLoading) {
                return const _LoadingContent();
              }

              if (state.error != null) {
                return _ErrorContent(error: state.error!);
              }

              return _RestaurantsList(
                restaurants: state.restaurants,
                favoriteRestaurants: widget.favoriteRestaurants,
                onTapRestaurant: widget.onTapRestaurant,
              );
            },
          );
        },
      ),
    );
  }
}

class _LoadingContent extends StatelessWidget {
  const _LoadingContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({required this.error});

  final BaseError error;

  @override
  Widget build(BuildContext context) {
    if (error case DataError()) {
      // here we could map data errors
      return switch (error) {
        RateLimitError() => const Center(
            child: Text("Rate limit exceeded"),
          ),
        NoInternetConnectionError() => const Center(
            child: Text("No internet connection"),
          ),
        _ => const Center(
            child: Text("Something went wrong"),
          ),
      };
    }

    // here we can map other errors
    return const Center(
      child: Text("Something went wrong"),
    );
  }
}

class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList({
    required this.restaurants,
    required this.favoriteRestaurants,
    required this.onTapRestaurant,
  });

  final List<Restaurant> restaurants;
  final List<Restaurant> favoriteRestaurants;
  final OnTapRestaurant onTapRestaurant;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        final isFavorite = favoriteRestaurants
                .indexWhere((element) => element.id == restaurant.id) !=
            -1;

        return RestaurantCard(
          restaurant: restaurant,
          onTap: () => onTapRestaurant(restaurant, isFavorite),
        );
      },
    );
  }
}
