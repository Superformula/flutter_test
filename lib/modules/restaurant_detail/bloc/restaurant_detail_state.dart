part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable {
  final Model model;

  const RestaurantDetailState(this.model);

  @override
  List<Object> get props => [model];
}

final class RestaurantDetailInitialState extends RestaurantDetailState {
  const RestaurantDetailInitialState(super.model);
}

final class LoadingDetailState extends RestaurantDetailState {
  const LoadingDetailState(super.model);
}

final class LoadedDetailState extends RestaurantDetailState {
  const LoadedDetailState(super.model);
}

final class ErrorLoadDetailState extends RestaurantDetailState {
  const ErrorLoadDetailState(super.model);
}

final class LoadingSetFavoriteState extends RestaurantDetailState {
  const LoadingSetFavoriteState(super.model);
}

final class LoadedSetFavoriteState extends RestaurantDetailState {
  const LoadedSetFavoriteState(super.model);
}

final class ErrorSetFavoriteState extends RestaurantDetailState {
  const ErrorSetFavoriteState(super.model);
}

class Model extends Equatable {
  final Restaurant? restaurant;
  final bool? isFavorite;

  const Model({this.isFavorite, this.restaurant});

  Model copyWith({bool? isFavorite, Restaurant? restaurant}) => Model(
        isFavorite: isFavorite ?? this.isFavorite,
        restaurant: restaurant ?? this.restaurant,
      );

  @override
  List<Object?> get props => [
        isFavorite,
        restaurant,
      ];
}
