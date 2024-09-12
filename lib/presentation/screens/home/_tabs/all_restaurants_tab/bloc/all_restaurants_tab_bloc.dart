import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';

part 'all_restaurants_tab_event.dart';
part 'all_restaurants_tab_state.dart';

class AllRestaurantsTabBloc
    extends Bloc<AllRestaurantsTabEvent, AllRestaurantsTabState> {
  AllRestaurantsTabBloc({
    required GetRestaurantsUseCase getRestaurantsUseCase,
  })  : _getRestaurantsUseCase = getRestaurantsUseCase,
        super(const AllRestaurantsTabState()) {
    on<LoadAllRestaurants>(onLoadAllRestaurants);
  }

  final GetRestaurantsUseCase _getRestaurantsUseCase;

  Future<void> onLoadAllRestaurants(
    LoadAllRestaurants event,
    Emitter<AllRestaurantsTabState> emit,
  ) async {
    final data = await _getRestaurantsUseCase();

    data.when(
      (restaurants) => emit(
        state.copyWith(
          restaurants: restaurants,
          contentIsLoading: false,
        ),
      ),
      (error) => state.copyWith(error: error, contentIsLoading: false),
    );
  }
}
