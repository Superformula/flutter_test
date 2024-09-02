part of 'yelp_bloc.dart';

@freezed
class YelpState with _$YelpState {
  const factory YelpState({
    required RestaurantQueryResult? restaurantsData,
    required List<Restaurant> favoriteRestaurants,
    required bool isGettingData,
    required String errorMessage,
  }) = _YelpState;

  factory YelpState.initial() => const YelpState(
        restaurantsData: null,
        favoriteRestaurants: [],
        isGettingData: false,
        errorMessage: '',
      );
}
