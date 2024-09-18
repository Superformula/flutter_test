part of 'favorite_restaurants_bloc.dart';

sealed class FavoriteRestaurantsState extends Equatable {
  const FavoriteRestaurantsState();

  @override
  List<Object> get props => [];
}

final class FavoriteRestaurantsLoading extends FavoriteRestaurantsState {
  const FavoriteRestaurantsLoading();
}

final class FavoriteRestaurantsError extends FavoriteRestaurantsState {
  const FavoriteRestaurantsError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class FavoriteRestaurantsData extends FavoriteRestaurantsState {
  const FavoriteRestaurantsData({required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  List<Object> get props => [restaurants];
}
