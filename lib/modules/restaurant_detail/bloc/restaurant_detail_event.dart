part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadDetailEvent extends RestaurantDetailEvent {
  final DetailPageArgurments? detailPageArgurments;

  const LoadDetailEvent({this.detailPageArgurments});

  @override
  List<Object?> get props => [detailPageArgurments];
}

class SetFavoriteEvent extends RestaurantDetailEvent {
  final bool isFavorite;

  const SetFavoriteEvent({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}
