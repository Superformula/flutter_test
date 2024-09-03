part of 'yelp_bloc.dart';

@freezed
class YelpEvent with _$YelpEvent {
  const factory YelpEvent.getRestaurantsData() = GetRestaurantsData;

  const factory YelpEvent.addFavoriteRestaurant(Restaurant restaurant) =
      AddFavoriteRestaurant;

  const factory YelpEvent.removeFavoriteRestaurant(String id) =
      RemoveFavoriteRestaurant;

  const factory YelpEvent.loadFavoriteRestaurants() = LoadFavoriteRestaurants;
}
