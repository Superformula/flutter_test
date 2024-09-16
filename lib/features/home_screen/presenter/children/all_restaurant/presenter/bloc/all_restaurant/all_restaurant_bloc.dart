import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

part 'all_restaurant_event.dart';
part 'all_restaurant_state.dart';

class AllRestaurantBloc extends Bloc<AllRestaurantEvent, AllRestaurantState> {
  AllRestaurantBloc({required this.hiveHelper, required this.yelpRepository})
      : super(AllRestaurantInitial()) {
    on<InitialEvent>(_onInitEvent);
  }

  final HiveHelper hiveHelper;
  final YelpRepository yelpRepository;

  Future<void> _onInitEvent(
    InitialEvent event,
    Emitter<AllRestaurantState> emit,
  ) async {
    emit(
      const LoadingState(),
    );
    final result = await yelpRepository.getRestaurants();
    result.when(
      ok: (data) {
        if (data.restaurants.isNotEmpty) {
          emit(
            DataLoadedState(
              restaurantList: data.restaurants,
            ),
          );
        } else {
          emit(const EmptyDataState());
        }
      },
      err: (error) {
        emit(
          ErrorState(
            error: error.toString(),
          ),
        );
      },
    );
  }
}
