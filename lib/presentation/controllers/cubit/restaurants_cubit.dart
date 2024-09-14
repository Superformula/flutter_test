import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';

part 'restaurants_cubit_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsCubitState> {
  RestaurantsCubit({required this.getRestaurantsUsecaseContract})
      : super(RestaurantsCubitInitial());

  final GetRestaurantsUsecaseContract getRestaurantsUsecaseContract;

  Future<void> getRestaurants({bool forceFetch = false}) async {
    emit(RestaurantsCubitLoading());
    try {
      final restaurants = await getRestaurantsUsecaseContract.getRestaurants(
        forceFetch: forceFetch,
      );
      emit(RestaurantsCubitLoaded(restaurants));
    } catch (e) {
      emit(RestaurantsCubitError(e.toString()));
    }
  }
}
