import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc(this.usecase) : super(RestaurantsInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(RestaurantsLoading());
      try {
        final restaurants = await usecase.getRestaurants();
        emit(RestaurantsReady(
          restaurants,
          size: restaurants.length,
        ));
      } on RestaurantListException catch (e) {
        emit(RestaurantsError(e));
      } catch (e) {
        emit(RestaurantsError(RestaurantListException()));
      }
    }, transformer: sequential());
    on<AddMoreRestaurants>(
      (event, emit) async {
        try {
          if (state is RestaurantsReady) {
            emit((state as RestaurantsReady).copyWith(isLoadingMore: true));
            await usecase.loadMoreRestaurants(
                offset: event.offset, limit: event.limit);
            final restaurants = await usecase.getRestaurants();

            emit((state as RestaurantsReady).copyWith(
                isLoadingMore: false,
                restaurants: restaurants,
                size: restaurants.length));
          }
        } catch (e) {
          emit((state as RestaurantsReady)
              .copyWith(isLoadingMore: false, hasError: true));
        }
      },
    );
  }
  final RestaurantsUsecase usecase;
  @override
  void onChange(Change<RestaurantsState> change) {
    // debugPrint(
    //     change.currentState.toString() + " - " + change.nextState.toString());
    super.onChange(change);
  }
}
