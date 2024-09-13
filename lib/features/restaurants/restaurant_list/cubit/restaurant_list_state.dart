part of 'restaurant_list_cubit.dart';

@immutable
sealed class RestaurantListState {}

final class RestaurantListInitial extends RestaurantListState {}

final class RestaurantListLoading extends RestaurantListState {}

final class RestaurantListError extends RestaurantListState {
  RestaurantListError({required this.errorMessage});
  final String errorMessage;
}

final class RestaurantListLoaded extends RestaurantListState {
  RestaurantListLoaded({required this.restaurants});
  final List<Restaurant> restaurants;
}
