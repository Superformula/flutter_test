import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc(RestaurantRepository repository)
      : _repository = repository,
        super(const RestaurantDetailLoading()) {
    on<ToggleRestaurantFavorite>(_onToggleRestaurantFavorite);
    on<FetchRestaurantIsFavorite>(_onFetchRestaurantIsFavorite);
  }

  final RestaurantRepository _repository;

  FutureOr<void> _onToggleRestaurantFavorite(
    ToggleRestaurantFavorite event,
    Emitter<RestaurantDetailState> emit,
  ) async {
    final isFavorite = await _repository.isFavorite(event.restaurant.id ?? '');
    if (isFavorite) {
      _repository.deleteFavoriteRestaurant(event.restaurant);
    } else {
      _repository.saveFavoriteRestaurant(event.restaurant);
    }
    emit(RestaurantDetailLoaded(isFavorite: !isFavorite));
  }

  FutureOr<void> _onFetchRestaurantIsFavorite(
    FetchRestaurantIsFavorite event,
    Emitter<RestaurantDetailState> emit,
  ) async {
    emit(const RestaurantDetailLoading());
    final isFavorite = await _repository.isFavorite(event.restaurant.id ?? '');
    emit(RestaurantDetailLoaded(isFavorite: isFavorite));
  }
}
