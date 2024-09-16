part of 'favorites_restaurants_bloc.dart';

@immutable
sealed class FavoritesRestaurantsState {}

final class FavoritesRestaurantsInitial extends FavoritesRestaurantsState {}

final class FavoritesRestaurantsLoading extends FavoritesRestaurantsState {}

final class FavoriteRestaurantsListError extends FavoritesRestaurantsState {
  FavoriteRestaurantsListError(this.exception);
  final FavoritesRestaurantsListException exception;
}

final class AddFavoriteRestaurantsError extends FavoritesRestaurantsState {
  AddFavoriteRestaurantsError(this.exception);
  final AddFavoriteRestaurantException exception;
}

final class RemoveFavoriteRestaurantsError extends FavoritesRestaurantsState {
  RemoveFavoriteRestaurantsError(this.exception);
  final RemoveFavoriteRestaurantException exception;
}

final class FavoritesRestaurantsReady extends FavoritesRestaurantsState {
  FavoritesRestaurantsReady(this.favoritesRestaurants);
  final List<Restaurant> favoritesRestaurants;
}
