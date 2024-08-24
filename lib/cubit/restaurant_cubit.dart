import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/models/restaurant.dart';

import '../usecases/fetch_restaurants.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this.fetchRestaurantsUseCase) : super(RestaurantInitial());
  final FetchRestaurants fetchRestaurantsUseCase;
  Future<void> fetchRestaurants() async {
    emit(LoadingRestaurantsState());
    RestaurantQueryResult? result =
        await fetchRestaurantsUseCase.getRestaurantsFromCache();
    if (result != null) {
      emit(RestaurantsLoadedState(result: result));
    } else {
      emit(
        ErrorState(
          message:
              'The server encountered a problem and we couldn\'t load the list.',
        ),
      );
    }
  }
}
