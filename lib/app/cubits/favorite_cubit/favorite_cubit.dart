import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:restaurant_tour/app/app.dart';

part 'favorite_state.dart';

/// [FavoriteCubit] manages the favorite restaurants state in the app.
///
/// It extends [HydratedCubit] to persist the favorite restaurants across
/// app sessions using local storage. This allows users to keep their favorite
/// restaurants even after restarting the app.
///
/// ### State Management:
/// - The cubit starts with an initial state of [FavoriteLoaded] containing an empty list of restaurants.
/// - It supports toggling restaurants as favorites using [toggleFavorite].
/// - The cubit also provides functionality to check if a restaurant is a favorite using [isFavorite].
///
/// ### Persistence:
/// - The cubit persists the state using the [toJson] and [fromJson] methods,
///   allowing it to restore the favorite restaurants list when the app is reopened.
class FavoriteCubit extends HydratedCubit<FavoriteState> {
  /// Initializes the [FavoriteCubit] with an empty list of favorite restaurants.
  FavoriteCubit() : super(FavoriteLoaded(restaurants: []));

  /// Toggles a restaurant as a favorite.
  ///
  /// If the restaurant is already in the list, it is removed. If it isn't, it is added.
  /// Emits a [FavoriteLoaded] state with the updated list of favorite restaurants.
  /// If the state is not [FavoriteLoaded], it emits a [FavoriteError] state.
  void toggleFavorite(Restaurant restaurant) {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final List<Restaurant> updatedList = List.from(currentState.restaurants);

      Restaurant? existingRestaurant = updatedList.firstWhere(
        (r) => r.id == restaurant.id,
        orElse: () => const Restaurant(),
      );

      if (existingRestaurant != const Restaurant()) {
        updatedList.remove(existingRestaurant);
      } else {
        updatedList.add(restaurant);
      }

      emit(FavoriteLoaded(restaurants: updatedList));
    } else {
      emit(FavoriteError());
    }
  }

  /// Checks if a restaurant is already in the list of favorite restaurants.
  ///
  /// Returns `true` if the restaurant is in the favorites list, otherwise `false`.
  bool isFavorite(Restaurant restaurant) {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      return currentState.restaurants.any((r) => r.id == restaurant.id);
    }
    return false;
  }

  /// Restores the list of favorite restaurants from a JSON map.
  ///
  /// This method is used by [HydratedCubit] to restore the cubit's state when
  /// the app is restarted. It attempts to deserialize the list of restaurants.
  /// If an error occurs, it returns a [FavoriteError] state.
  @override
  FavoriteState fromJson(Map<String, dynamic> json) {
    try {
      final restaurants = (json['restaurants'] as List)
          .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
          .toList();
      return FavoriteLoaded(restaurants: restaurants);
    } catch (e) {
      return FavoriteError();
    }
  }

  /// Converts the current state to a JSON map.
  ///
  /// This method is used by [HydratedCubit] to save the current state to local
  /// storage, allowing it to persist across app restarts. It serializes the list
  /// of favorite restaurants into a JSON map.
  @override
  Map<String, dynamic>? toJson(FavoriteState state) {
    if (state is FavoriteLoaded) {
      return {
        'restaurants':
            state.restaurants.map((restaurant) => restaurant.toJson()).toList(),
      };
    }
    return null;
  }
}
