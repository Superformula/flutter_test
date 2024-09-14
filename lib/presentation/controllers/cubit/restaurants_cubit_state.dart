part of 'restaurants_cubit.dart';

@immutable
sealed class RestaurantsCubitState {}

final class RestaurantsCubitInitial extends RestaurantsCubitState {}

final class RestaurantsCubitLoading extends RestaurantsCubitState {}

final class RestaurantsCubitLoaded extends RestaurantsCubitState {
  final List<Restaurant> restaurants;

  RestaurantsCubitLoaded(this.restaurants);
}

final class RestaurantsCubitError extends RestaurantsCubitState {
  final String message;

  RestaurantsCubitError(this.message);
}
