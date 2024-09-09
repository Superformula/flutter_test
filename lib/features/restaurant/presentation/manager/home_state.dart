import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Restaurant> restaurants;
  final List<Restaurant> favorites;
  HomeLoaded({
    required this.restaurants,
    required this.favorites,
  });
}

class HomeError extends HomeState {}
