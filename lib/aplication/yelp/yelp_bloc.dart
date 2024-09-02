import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository.dart';

part 'yelp_bloc.freezed.dart';

part 'yelp_state.dart';
part 'yelp_event.dart';

@injectable
class YelpBloc extends Bloc<YelpEvent, YelpState> {
  final YelpRepository _yelpRepository;

  YelpBloc(this._yelpRepository) : super(YelpState.initial()) {
    _setupEventActions();
  }

  _setupEventActions() {
    on<GetRestaurantsData>(((event, emit) async {
      emit(state.copyWith(isGettingData: true));

      /// This delay is not need, just added to see the CircularProgressIndicator
      await Future.delayed(const Duration(milliseconds: 500));
      emit(await _performGetRestaurantsData(_yelpRepository.getRestaurants));
    }));

    on<AddFavoriteRestaurant>((event, emit) async {
      final updatedFavorites = [
        ...state.favoriteRestaurants,
        event.restaurant,
      ];
      emit(state.copyWith(favoriteRestaurants: updatedFavorites));
    });

    on<RemoveFavoriteRestaurant>((event, emit) async {
      final updatedFavorites = state.favoriteRestaurants
          .where(
            (restaurant) => restaurant.id != event.id,
          )
          .toList();
      emit(state.copyWith(favoriteRestaurants: updatedFavorites));
    });
  }

  Future<YelpState> _performGetRestaurantsData(
      Future<RestaurantQueryResult?> Function() forwardedCall) async {
    final response = await forwardedCall();

    if (response != null) {
      return state.copyWith(restaurantsData: response, isGettingData: false);
    } else {
      return state.copyWith(
          errorMessage: "failureMessage", isGettingData: false);
    }
  }
}
