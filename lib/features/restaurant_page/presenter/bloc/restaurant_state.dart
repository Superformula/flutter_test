part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable {
  const RestaurantState();
}

final class RestaurantInitial extends RestaurantState {
  @override
  List<Object> get props => [];
}
