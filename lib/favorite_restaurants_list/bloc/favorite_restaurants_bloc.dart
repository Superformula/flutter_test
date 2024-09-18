import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

part 'favorite_restaurants_event.dart';
part 'favorite_restaurants_state.dart';

class FavoriteRestaurantsBloc
    extends Bloc<FavoriteRestaurantsEvent, FavoriteRestaurantsState> {
  FavoriteRestaurantsBloc(RestaurantRepository repository)
      : _repository = repository,
        super(const FavoriteRestaurantsLoading()) {
    on<FetchFavoriteRestaurants>(_onFetchFavoriteRestaurants);
  }

  final RestaurantRepository _repository;

  FutureOr<void> _onFetchFavoriteRestaurants(
    FetchFavoriteRestaurants event,
    Emitter<FavoriteRestaurantsState> emit,
  ) async {
    try {
      emit(const FavoriteRestaurantsLoading());
      final response = await _repository.fetchFavoriteRestaurants();
      emit(FavoriteRestaurantsData(restaurants: response));
    } catch (e) {
      emit(FavoriteRestaurantsError(message: e.toString()));
    }
  }
}
