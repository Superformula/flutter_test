part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final Model model;

  const HomeState(this.model);

  @override
  List<Object> get props => [model];
}

final class HomeInitialState extends HomeState {
  const HomeInitialState(super.model);
}

final class LoadingRestaurantsState extends HomeState {
  const LoadingRestaurantsState(super.model);
}

final class LoadedRestaurantsState extends HomeState {
  const LoadedRestaurantsState(super.model);
}

final class ErrorLoadRestaurantsState extends HomeState {
  const ErrorLoadRestaurantsState(super.model);
}

class Model extends Equatable {
  final List<Restaurant>? restaurants;
  final List<Restaurant>? favoriteRestaurants;
  final int? initialIndex;

  const Model({
    this.restaurants,
    this.favoriteRestaurants,
    this.initialIndex,
  });

  Model copyWith({
    List<Restaurant>? restaurants,
    List<Restaurant>? favoriteRestaurants,
    int? initialIndex,
  }) =>
      Model(
        restaurants: restaurants ?? this.restaurants,
        favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
        initialIndex: initialIndex ?? this.initialIndex,
      );

  @override
  List<Object?> get props => [
        restaurants,
        favoriteRestaurants,
        initialIndex,
      ];
}
