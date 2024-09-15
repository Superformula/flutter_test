import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/restaurant.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState());

  Future<void> favoriteRestaurant(Restaurant restaurant) async {
    final newFavorites = List<Restaurant>.from(state.favorites);

    final containsAddress = state.favorites.contains(restaurant);

    if (containsAddress) {
      newFavorites.remove(restaurant);

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
}
