import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/data/shared_services.dart';

import '../../../data/models/restaurant.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.sharedServices}) : super(FavoriteState());

  final SharedServices sharedServices;

  Future<void> favoriteRestaurant(Restaurant restaurant) async {
    final newFavorites = List<Restaurant>.from(state.favorites);

    final containsAddress = state.favorites.contains(restaurant);

    if (containsAddress) {
      newFavorites.remove(restaurant);

      await sharedServices.saveListString(
        SharedPreferencesKeys.savedRestaurants,
        newFavorites,
      );

      emit(
        state.copyWith(
          favorites: newFavorites,
          status: FavoriteStatus.removed,
        ),
      );

      if (newFavorites.isEmpty) {
        emit(
          state.copyWith(
            favorites: newFavorites,
            status: FavoriteStatus.initial,
          ),
        );
      }
    } else {
      newFavorites.add(restaurant);

      await sharedServices.saveListString(
        SharedPreferencesKeys.savedRestaurants,
        newFavorites,
      );

      emit(
        state.copyWith(
          status: FavoriteStatus.favoriteSuccess,
        ),
      );
      emit(
        state.copyWith(
          favorites: newFavorites,
          status: FavoriteStatus.success,
        ),
      );
    }
  }

  Future<void> loadRestaurants() async {
    final restaurantList = await sharedServices
        .getListString(SharedPreferencesKeys.savedRestaurants);

    if (restaurantList.isEmpty) {
      emit(
        state.copyWith(
          status: FavoriteStatus.initial,
          favorites: [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FavoriteStatus.success,
          favorites: restaurantList,
        ),
      );
    }
  }
}
