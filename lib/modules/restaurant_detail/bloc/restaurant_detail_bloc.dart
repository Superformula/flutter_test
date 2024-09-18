import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/modules/restaurant_detail/models/detail_page_arguments.dart';
import 'package:restaurant_tour/modules/restaurant_detail/restaurant_detail_repository.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc({
    required this.restaurantDetailRepository,
  }) : super(
          const RestaurantDetailInitialState(Model()),
        ) {
    on<LoadDetailEvent>(_onLoadDetailEvent);
    on<SetFavoriteEvent>(_onSetFavoriteEvent);
  }

  final RestaurantDetailRepository restaurantDetailRepository;

  _onLoadDetailEvent(
    LoadDetailEvent event,
    Emitter<RestaurantDetailState> emit,
  ) {
    emit(LoadingDetailState(state.model));
    final restaurant = event.detailPageArgurments?.restaurant;
    final isFromFavorite = event.detailPageArgurments?.isFromFavorite ?? false;

    if (restaurant != null) {
      emit(
        LoadedDetailState(
          state.model.copyWith(
            restaurant: restaurant,
            isFavorite: isFromFavorite,
          ),
        ),
      );
      return;
    }

    emit(ErrorLoadDetailState(state.model));
  }

  _onSetFavoriteEvent(
    SetFavoriteEvent event,
    Emitter<RestaurantDetailState> emit,
  ) async {
    emit(LoadingSetFavoriteState(state.model));
    final isFavorite = event.isFavorite;
    final restaurant = state.model.restaurant!;

    try {
      if (isFavorite) {
        await restaurantDetailRepository.addRestaurant(
          restaurant: restaurant,
        );
      } else {
        await restaurantDetailRepository.deleteRestaurant(
          restaurantId: restaurant.id ?? '',
        );
      }

      emit(
        LoadedSetFavoriteState(
          state.model.copyWith(
            isFavorite: isFavorite,
          ),
        ),
      );
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      emit(ErrorSetFavoriteState(state.model));
    }
  }
}
