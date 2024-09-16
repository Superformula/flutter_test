part of 'favorites_restaurants_bloc.dart';

@immutable
sealed class FavoritesRestaurantsEvent {}

class LoadFavoriteRestaurants extends FavoritesRestaurantsEvent {}

class AddFavoriteRestaurant extends FavoritesRestaurantsEvent {}

class RemoveFavoriteRestaurant extends FavoritesRestaurantsEvent {}
