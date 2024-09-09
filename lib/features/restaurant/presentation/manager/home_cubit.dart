import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_favorites.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/mark_favorite.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_state.dart';

import '../../data/models/restaurant.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.getRestaurantsUsecase,
    this.markFavoriteUsecase,
    this.getFavoritesUsecase,
  ) : super(HomeInitial());

  final GetRestaurants getRestaurantsUsecase;
  final MarkFavorite markFavoriteUsecase;
  final GetFavorites getFavoritesUsecase;

  List<Restaurant> _restaurants = [];

  Future getRestaurants() async {
    emit(HomeLoading());
    final restaurantsResult = await getRestaurantsUsecase();
    restaurantsResult.fold(
      (failure) {
        emit(HomeError());
      },
      (success) {
        _restaurants = success;
        getFavorites();
      },
    );
  }

  Future getFavorites() async {
    final result = await getFavoritesUsecase();
    List<String> favoritedIds =
        result.fold((l) => [], (favorites) => favorites);
    List<Restaurant> favoriteRestaurants = [];
    for (final r in _restaurants) {
      for (final f in favoritedIds) {
        if (r.id == f) {
          favoriteRestaurants.add(r);
          r.favorite = true;
        }
      }
    }
    emit(
      HomeLoaded(
        restaurants: _restaurants,
        favorites: favoriteRestaurants,
      ),
    );
  }

  Future markFavorite(String id) async {
    await markFavoriteUsecase(id);
  }
}
