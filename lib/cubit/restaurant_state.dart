part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState extends Equatable {}

class RestaurantInitial extends RestaurantState {
  @override
  List<Object?> get props => [];
}

class LoadingRestaurantsState extends RestaurantState {
  @override
  List<Object?> get props => [];
}

class RestaurantsLoadedState extends RestaurantState {
  final RestaurantQueryResult result;

  RestaurantsLoadedState({required this.result});
  @override
  List<Object?> get props => [result];
}

class ErrorState extends RestaurantState {
  final String message;

  ErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
