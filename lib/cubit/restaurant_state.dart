// ignore_for_file: overridden_fields

part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState extends Equatable {
  final List<String> favoriteRestaurants;
  final RestaurantQueryResult? result;

  const RestaurantState({
    required this.favoriteRestaurants,
    this.result,
  });

  RestaurantState copyWith({List<String>? favoriteRestaurants});
  @override
  List<Object?> get props => [favoriteRestaurants];
}

class RestaurantInitial extends RestaurantState {
  const RestaurantInitial({required super.favoriteRestaurants});

  @override
  RestaurantState copyWith({List<String>? favoriteRestaurants}) {
    return RestaurantInitial(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
    );
  }
}

class LoadingRestaurantsState extends RestaurantState {
  const LoadingRestaurantsState({required super.favoriteRestaurants});

  @override
  List<Object?> get props => [favoriteRestaurants];

  @override
  RestaurantState copyWith({List<String>? favoriteRestaurants}) {
    return LoadingRestaurantsState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
    );
  }
}

class RestaurantsLoadedState extends RestaurantState {
  const RestaurantsLoadedState({
    required this.result,
    required super.favoriteRestaurants,
  });

  @override
  final RestaurantQueryResult result;

  @override
  List<Object?> get props => [result, favoriteRestaurants];

  @override
  RestaurantsLoadedState copyWith({List<String>? favoriteRestaurants}) {
    return RestaurantsLoadedState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      result: result,
    );
  }
}

class FavoriteRestaurantState extends RestaurantState {
  @override
  final RestaurantQueryResult result;
  @override
  final List<String> favoriteRestaurants;

  const FavoriteRestaurantState({
    required this.result,
    required this.favoriteRestaurants,
  }) : super(favoriteRestaurants: favoriteRestaurants, result: result);
  @override
  List<Object?> get props => [favoriteRestaurants];

  @override
  FavoriteRestaurantState copyWith({List<String>? favoriteRestaurants}) {
    return FavoriteRestaurantState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      result: result,
    );
  }
}

class ErrorState extends RestaurantState {
  final String message;

  const ErrorState({
    required super.favoriteRestaurants,
    super.result,
    required this.message,
  });

  @override
  RestaurantState copyWith({List<String>? favoriteRestaurants}) {
    return ErrorState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      message: message,
    );
  }
}
