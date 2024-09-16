import 'package:bloc/bloc.dart';
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
        emit(RestaurantsReady(restaurants));
      } catch (e) {
        emit(RestaurantsError(RestaurantListException()));
      }
    });
  }
  final RestaurantsUsecase usecase;
}
