import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/modules/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository})
      : super(
          const HomeInitialState(Model()),
        ) {
    on<LoadRestaurantsEvent>(_onLoadRestaurantsEvent);
  }

  final HomeRepository homeRepository;

  _onLoadRestaurantsEvent(
    LoadRestaurantsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingRestaurantsState(state.model));
    try {
      final restaurants = await homeRepository.getRestaurants();
      emit(
        LoadedRestaurantsState(
          state.model.copyWith(
            restaurants: restaurants,
          ),
        ),
      );
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      emit(ErrorLoadRestaurantsState(state.model));
    }
  }
}
