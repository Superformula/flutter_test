part of 'all_restaurants_tab_bloc.dart';

sealed class AllRestaurantsTabEvent {
  const AllRestaurantsTabEvent();
}

final class LoadAllRestaurants extends AllRestaurantsTabEvent {
  const LoadAllRestaurants();
}
