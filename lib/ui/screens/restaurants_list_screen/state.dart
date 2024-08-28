import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'state.freezed.dart';

/// The state of [RestaurantsListScreen].
@freezed
sealed class RestaurantsListScreenState with _$RestaurantsListScreenState {
  /// A state representing the screen is being loaded.
  const factory RestaurantsListScreenState.loading() = RestaurantsListLoading;

  /// A state representing the screen has data.
  const factory RestaurantsListScreenState.data({
    @Default([]) List<Restaurant> restaurants,
  }) = RestaurantsListData;

  /// A state representing the screen couldn't load and has an error.
  const factory RestaurantsListScreenState.error({
    required Exception exception,
    StackTrace? stackTrace,
  }) = RestaurantsListError;
}
