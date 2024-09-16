part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeDataLoadedState extends HomeState {
  const HomeDataLoadedState({
    required this.restaurantList,
    required this.favoriteList,
  });

  final List<Restaurant> restaurantList;
  final List<Restaurant> favoriteList;

  @override
  List<Object> get props => [restaurantList];
}

class HomeEmptyDataState extends HomeState {
  const HomeEmptyDataState();

  @override
  List<Object> get props => [];
}

class ErrorState extends HomeState {
  const ErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
