import 'package:bloc/bloc.dart';
import 'package:restaurant_tour/view/cubit/restaurants/restaurants.dart';

import '../../../data/repositories/yelp_repository.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit(this.yelpRepo) : super(RestaurantsState());

  final YelpRepository yelpRepo;

  Future<void> fetchRestaurants() async {
    emit(state.copyWith(status: RestaurantsStatus.loading));

    final result = await yelpRepo.getRestaurants();

    emit(
      result.fold(
        () => state.copyWith(
          status: RestaurantsStatus.failure,
          errorMessage: 'An unexpected error occurred',
        ),
        (queryResult) {
          final restaurants = queryResult.restaurants;
          final isValidResult = restaurants != null && restaurants.isNotEmpty;

          if (isValidResult) {
            return state.copyWith(
              status: RestaurantsStatus.success,
              restaurants: restaurants,
            );
          }

          return state.copyWith(
            status: RestaurantsStatus.failure,
            errorMessage: 'Invalid restaurants',
          );
        },
      ),
    );
  }
}
