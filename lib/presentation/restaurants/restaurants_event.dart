part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsEvent {}

class LoadRestaurants extends RestaurantsEvent {}
