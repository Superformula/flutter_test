part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsReady extends RestaurantsState {
  RestaurantsReady(this.restaurants);
  final List<Restaurant> restaurants;
}

final class RestaurantsError extends RestaurantsState {
  RestaurantsError(this.exception);
  final RestaurantListException exception;
}
