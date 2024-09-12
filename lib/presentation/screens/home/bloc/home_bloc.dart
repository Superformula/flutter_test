import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase,
  })  : _getFavoriteRestaurantsUseCase = getFavoriteRestaurantsUseCase,
        super(const HomeState()) {
    on<LoadFavoriteRestaurants>(_onLoadFavoriteRestaurants);
  }

  final GetFavoriteRestaurantsUseCase _getFavoriteRestaurantsUseCase;

  void _onLoadFavoriteRestaurants(
    LoadFavoriteRestaurants event,
    Emitter<HomeState> emit,
  ) async {
    await emit.onEach(
      _getFavoriteRestaurantsUseCase(),
      onData: (data) {
        emit(state.copyWith(favoriteRestaurants: data));
      },
    );
  }
}
