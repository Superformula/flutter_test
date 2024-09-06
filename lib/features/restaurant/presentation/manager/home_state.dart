import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Restaurant> restaurants;
  HomeLoaded({required this.restaurants});
}

class HomeError extends HomeState {}
