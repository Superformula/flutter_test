part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsEvent {}

class LoadRestaurants extends RestaurantsEvent {}

class AddMoreRestaurants extends RestaurantsEvent {
  AddMoreRestaurants({required this.limit, required this.offset});
  final int limit;
  final int offset;
}
