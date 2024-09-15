part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  FavoritesLoaded({
    required this.favorites,
  });

  final List<Restaurant> favorites;
}

final class FavoritesIsFavorite extends FavoritesState {
  FavoritesIsFavorite({
    required this.isFavorite,
  });

  final bool isFavorite;
}

final class FavoritesError extends FavoritesState {
  FavoritesError({
    required this.message,
  });

  final String message;
}

final class FavoritesEmpty extends FavoritesState {}
