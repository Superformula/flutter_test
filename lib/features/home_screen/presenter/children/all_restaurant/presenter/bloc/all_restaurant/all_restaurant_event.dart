part of 'all_restaurant_bloc.dart';

sealed class AllRestaurantEvent extends Equatable {
  const AllRestaurantEvent();
}

class InitialEvent extends AllRestaurantEvent {
  const InitialEvent();

  @override
  List<Object> get props => [];
}
