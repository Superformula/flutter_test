import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/restaurant.dart';
import '../../domain/usecases/get_all_restaurants.dart';
import '../../failures/failures.dart';
part 'home_event.dart';
part 'home_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final GetAllRestaurants getAllRestaurants;

  RestaurantsBloc(this.getAllRestaurants) : super(RestaurantsInitial()) {
    on<RestaurantsEvent>(_getAllRestaurants);
  }

  FutureOr<void> _getAllRestaurants(
    RestaurantsEvent event,
    Emitter<RestaurantsState> emit,
  ) async {
    emit(LoadingRestaurantsState());
    final result = await getAllRestaurants();
    result.fold(
      (failure) => emit(ErrorRestaurantsState(failure)),
      (restaurantList) => emit(ResultRestaurantsState(restaurantList)),
    );
  }
}
