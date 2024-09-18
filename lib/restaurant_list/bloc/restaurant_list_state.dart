part of 'restaurant_list_bloc.dart';

sealed class RestaurantListState extends Equatable {
  const RestaurantListState();

  @override
  List<Object?> get props => [];
}

final class RestaurantListLoading extends RestaurantListState {
  const RestaurantListLoading();
}

final class RestaurantListError extends RestaurantListState {
  const RestaurantListError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

final class RestaurantListData extends RestaurantListState {
  const RestaurantListData({required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  List<Object?> get props => [restaurants];
}

final class RestaurantDetail extends RestaurantListState {
  const RestaurantDetail({required this.restaurant});

  final Restaurant restaurant;

  @override
  List<Object?> get props => [restaurant];
}
