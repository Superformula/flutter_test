part of 'restaurant_list_bloc.dart';

sealed class RestaurantListEvent extends Equatable {
  const RestaurantListEvent();
  @override
  List<Object?> get props => [];
}

class FetchRestaurantList extends RestaurantListEvent {
  const FetchRestaurantList();
}

class GoToRestaurantDetail extends RestaurantListEvent {
  const GoToRestaurantDetail({required this.restaurant});

  final Restaurant restaurant;

  @override
  List<Object?> get props => [restaurant];
}
