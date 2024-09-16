part of 'favorites_restaurants_bloc.dart';

@immutable
sealed class FavoritesRestaurantsEvent {}

class LoadFavoritesRestaurants extends FavoritesRestaurantsEvent {}

class AddFavoriteRestaurant extends FavoritesRestaurantsEvent {
  AddFavoriteRestaurant(this.restaurant);
  final Restaurant restaurant;
}

class RemoveFavoriteRestaurant extends FavoritesRestaurantsEvent {
  RemoveFavoriteRestaurant(this.restaurant);
  final Restaurant restaurant;
}
