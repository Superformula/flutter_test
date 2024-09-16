import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitialEvent>(_onInitialEvent);
  }

  Future<void> _onInitialEvent(
      InitialEvent event,
      Emitter<HomeState> emit,
      ) async {
    final yelpRepo = YelpRepository();
    final result = await yelpRepo.getRestaurants();

    emit(
      HomeLoadingState(),
    );
    result.when(
      ok: (data) {
        if (data.restaurants.isNotEmpty) {
          emit(
            HomeDataLoadedState(
              restaurantList: data.restaurants,
            ),
          );
        } else {
          emit(const HomeEmptyDataState());
        }
      },
      err: (error) {
        emit(ErrorState(error: error.toString()));
      },
    );
  }
}