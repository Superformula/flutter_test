part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable {
  const RestaurantState();
}

final class RestaurantInitial extends RestaurantState {
  @override
  List<Object> get props => [];
}

class AppBarLoadingState extends RestaurantState {
  const AppBarLoadingState();

  @override
  List<Object> get props => [];
}

class VerifiedState extends RestaurantState {
  const VerifiedState({required this.isFavorite});

  final bool isFavorite;

  @override
  List<Object> get props => [isFavorite];
}

class ErrorState extends RestaurantState {
  const ErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [];
}

class FavoriteOperationSuccess extends RestaurantState {
  const FavoriteOperationSuccess();

  @override
  List<Object> get props => [];
}

class FavoriteOperationError extends RestaurantState {
  const FavoriteOperationError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
