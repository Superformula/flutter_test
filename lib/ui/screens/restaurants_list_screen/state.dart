import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'state.freezed.dart';

/// The state of the 
@freezed
sealed class RestaurantsListScreenState with _$RestaurantsListScreenState {
  const factory RestaurantsListScreenState.loading() = LoadingRestaurants;

  const factory RestaurantsListScreenState.data({
    @Default([]) List<Restaurant> restaurants,
  }) = RestaurantsData;

  const factory RestaurantsListScreenState.error({
    required Exception exception,
    StackTrace? stackTrace,
  }) = RestaurantsError;
}
