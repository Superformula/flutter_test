import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'state.freezed.dart';

@freezed
sealed class ListRestaurantsScreenState with _$ListRestaurantsScreenState {
  const factory ListRestaurantsScreenState.loading() = LoadingRestaurants;

  const factory ListRestaurantsScreenState.data({
    @Default([]) List<Restaurant> restaurants,
  }) = RestaurantsData;

  const factory ListRestaurantsScreenState.error({
    required Exception exception,
    StackTrace? stackTrace,
  }) = RestaurantsError;
}
