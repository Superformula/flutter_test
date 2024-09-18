part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsReady extends RestaurantsState {
  RestaurantsReady(this.restaurants,
      {this.isLoadingMore = false,
      this.size = 10,
      this.limit = 10,
      this.hasError = false});
  final List<Restaurant> restaurants;
  final bool isLoadingMore;
  final bool hasError;
  final int size;
  final int limit;
  RestaurantsReady copyWith({
    List<Restaurant>? restaurants,
    bool? isLoadingMore,
    int? size,
    int? limit,
    bool? hasError,
  }) {
    return RestaurantsReady(
      restaurants ?? this.restaurants,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      size: size ?? this.size,
      hasError: hasError ?? this.hasError,
      limit: limit ?? this.limit,
    );
  }
}

final class RestaurantsError extends RestaurantsState {
  RestaurantsError(this.exception);
  final RestaurantListException exception;
}
