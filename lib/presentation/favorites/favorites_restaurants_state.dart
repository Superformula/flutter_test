part of 'favorites_restaurants_bloc.dart';

@immutable
sealed class FavoritesRestaurantsState {}

final class FavoritesRestaurantsInitial extends FavoritesRestaurantsState {}

final class FavoriteRestaurantsLoading extends FavoritesRestaurantsState {}

final class FavoriteRestaurantsError extends FavoritesRestaurantsState {}

final class FavoriteRestaurantReady extends FavoritesRestaurantsState {
  FavoriteRestaurantReady(this.favoriteRestaurants);
  final List<Restaurant> favoriteRestaurants;
}
