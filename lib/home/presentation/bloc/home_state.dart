part of 'home_bloc.dart';

abstract class RestaurantsState {}

class RestaurantsInitial extends RestaurantsState {}

class LoadingRestaurantsState extends RestaurantsState {}

class ResultRestaurantsState extends RestaurantsState {
  final Map<String, RestaurantQueryResult> listRestaurants;
  ResultRestaurantsState(this.listRestaurants);
}

class ErrorRestaurantsState extends RestaurantsState {
  final RestaurantsFailure error;

  ErrorRestaurantsState(this.error);
}
