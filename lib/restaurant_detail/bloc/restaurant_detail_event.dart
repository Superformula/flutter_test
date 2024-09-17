part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantIsFavorite extends RestaurantDetailEvent {
  final Restaurant restaurant;

  const FetchRestaurantIsFavorite({required this.restaurant});

  @override
  List<Object?> get props => [restaurant];
}

class ToggleRestaurantFavorite extends RestaurantDetailEvent {
  const ToggleRestaurantFavorite({required this.restaurant});

  final Restaurant restaurant;

  @override
  List<Object?> get props => [restaurant];
}
