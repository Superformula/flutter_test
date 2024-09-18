import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc(RestaurantRepository repository)
      : _repository = repository,
        super(const RestaurantListLoading()) {
    on<FetchRestaurantList>(_onFetchRestaurantList);
    on<GoToRestaurantDetail>(_onGoToRestaurantDetail);
  }

  final RestaurantRepository _repository;

  FutureOr<void> _onFetchRestaurantList(
    FetchRestaurantList event,
    Emitter<RestaurantListState> emit,
  ) async {
    try {
      emit(const RestaurantListLoading());
      final response = await _repository.fetchRestaurants();
      final restaurants = response?.restaurants ?? [];
      emit(RestaurantListData(restaurants: restaurants));
    } catch (e) {
      emit(RestaurantListError(message: e.toString()));
      addError(e);
    }
  }

  FutureOr<void> _onGoToRestaurantDetail(
    GoToRestaurantDetail event,
    Emitter<RestaurantListState> emit,
  ) {
    emit(RestaurantDetail(restaurant: event.restaurant));
  }
}
