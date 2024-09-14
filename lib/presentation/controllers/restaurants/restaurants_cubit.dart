import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';

part 'restaurants_cubit_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsCubitState> {
  RestaurantsCubit({required this.getRestaurantsUsecaseContract})
      : super(RestaurantsCubitInitial());

  final GetRestaurantsUsecaseContract getRestaurantsUsecaseContract;

  int offset = 0;
  final List<Restaurant> _restaurants = [];

  Future<void> getRestaurants({bool forceFetch = false}) async {
    emit(RestaurantsCubitLoading());
    try {
      final restaurants = await getRestaurantsUsecaseContract.getRestaurants(
        forceFetch: forceFetch,
        offset: offset,
      );
      emit(RestaurantsCubitLoaded(restaurants));
    } catch (e) {
      emit(RestaurantsCubitError(e.toString()));
    }
  }

  Future<void> getNextPage({bool forceFetch = false}) async {
    emit(RestaurantsCubitLoading());
    try {
      offset += 20;
      final restaurants = await getRestaurantsUsecaseContract.getRestaurants(
        forceFetch: true,
        offset: offset,
      );
      _restaurants.addAll(restaurants);
      emit(RestaurantsCubitLoaded(restaurants));
    } catch (e) {
      emit(RestaurantsCubitError(e.toString()));
    }
  }
}
