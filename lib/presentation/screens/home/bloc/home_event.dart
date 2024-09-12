part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class LoadFavoriteRestaurants extends HomeEvent {
  const LoadFavoriteRestaurants();
}
