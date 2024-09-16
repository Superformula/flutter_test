part of 'cubit_restaurant_tour_presenter.dart';

@immutable
class RestaurantState {}

class RestaurantInitialState extends RestaurantState {}

class RestaurantLoadingState extends RestaurantState {}

class RestaurantSuccessState extends RestaurantState {}

class RestaurantErrorState extends RestaurantState {
  final String message;

  RestaurantErrorState(this.message);
}

class RestaurantTabState extends RestaurantState {}
