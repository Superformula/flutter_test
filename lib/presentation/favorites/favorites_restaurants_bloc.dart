import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'favorites_restaurants_event.dart';
part 'favorites_restaurants_state.dart';

class FavoritesRestaurantsBloc
    extends Bloc<FavoritesRestaurantsEvent, FavoritesRestaurantsState> {
  FavoritesRestaurantsBloc(this.usecase)
      : super(FavoritesRestaurantsInitial()) {
    on<LoadFavoritesRestaurants>((event, emit) async {
      try {
        emit(FavoritesRestaurantsLoading());
        final favorites = await usecase.getFavoriteRestaurants();
        emit(FavoritesRestaurantsReady(favorites));
      } catch (e) {
        emit(FavoriteRestaurantsListError(FavoritesRestaurantsListException()));
      }
    }, transformer: sequential());
    on<AddFavoriteRestaurant>((event, emit) async {
      try {
        while (state is FavoritesRestaurantsLoading) {
          Future.delayed(const Duration(milliseconds: 500));
        }
        emit(FavoritesRestaurantsLoading());
        await usecase.addFavoriteRestaurant(event.restaurant);
        final favoritesRestaurants = await usecase.getFavoriteRestaurants();
        emit(FavoritesRestaurantsReady(favoritesRestaurants));
      } catch (e) {
        debugPrint(e.toString());
        emit(AddFavoriteRestaurantsError(AddFavoriteRestaurantException()));
      }
    }, transformer: sequential());

    on<RemoveFavoriteRestaurant>((event, emit) async {
      try {
        while (state is FavoritesRestaurantsLoading) {
          Future.delayed(const Duration(milliseconds: 500));
        }
        emit(FavoritesRestaurantsLoading());
        await usecase.removeFavoriteRestaurant(event.restaurant);
        final favoritesRestaurants = await usecase.getFavoriteRestaurants();
        emit(FavoritesRestaurantsReady(favoritesRestaurants));
      } catch (e) {
        emit(
          RemoveFavoriteRestaurantsError(
            RemoveFavoriteRestaurantException(),
          ),
        );
      }
    }, transformer: sequential());
  }
  final RestaurantsUsecase usecase;

  @override
  void onChange(Change<FavoritesRestaurantsState> change) {
    // debugPrint(
    //     change.currentState.toString() + " - " + change.nextState.toString());
    super.onChange(change);
  }
}
