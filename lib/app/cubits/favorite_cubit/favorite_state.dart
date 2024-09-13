part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteError extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  FavoriteLoaded({required this.restaurants});
  List<Restaurant> restaurants;
}
