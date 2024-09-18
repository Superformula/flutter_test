part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable {
  const RestaurantDetailState();
  @override
  List<Object?> get props => [];
}

final class RestaurantDetailLoading extends RestaurantDetailState {
  const RestaurantDetailLoading();
}

final class RestaurantDetailLoaded extends RestaurantDetailState {
  final bool isFavorite;

  const RestaurantDetailLoaded({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}
