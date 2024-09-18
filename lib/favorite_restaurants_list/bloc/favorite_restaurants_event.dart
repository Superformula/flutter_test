part of 'favorite_restaurants_bloc.dart';

sealed class FavoriteRestaurantsEvent extends Equatable {
  const FavoriteRestaurantsEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteRestaurants extends FavoriteRestaurantsEvent {
  const FetchFavoriteRestaurants();
}
