import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

import '../usecases/fetch_restaurants.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this.fetchRestaurantsUseCase)
      : super(const RestaurantInitial(favoriteRestaurants: []));
  final FetchRestaurants fetchRestaurantsUseCase;

  Future<void> fetchRestaurants() async {
    emit(const LoadingRestaurantsState(favoriteRestaurants: []));
    RestaurantQueryResult? result =
        await fetchRestaurantsUseCase.getRestaurants();
    List<String> favoriteRestaurants =
        await fetchRestaurantsUseCase.getFavoriteRestaurants();
    if (result != null) {
      emit(
        RestaurantsLoadedState(
          result: result,
          favoriteRestaurants: favoriteRestaurants,
        ),
      );
    } else {
      emit(
        const ErrorState(
          message:
              'The server encountered a problem and we couldn\'t load the list.',
          favoriteRestaurants: [],
        ),
      );
    }
  }

  Future<void> favoriteAResturant(String id) async {
    final favoriteRestaurants = List<String>.from(state.favoriteRestaurants);
    if (favoriteRestaurants.contains(id)) {
      favoriteRestaurants.remove(id);
    } else {
      favoriteRestaurants.add(id);
    }
    // await fetchRestaurantsUseCase.saveFavoriteRestaurants(favoriteRestaurants);
    emit(
      FavoriteRestaurantState(
        result: state.result!,
        favoriteRestaurants: List.of(favoriteRestaurants),
      ),
    );
  }
}
