import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getRestaurantsUsecase) : super(HomeInitial());

  final GetRestaurants getRestaurantsUsecase;

  Future getRestaurants() async {
    emit(HomeLoading());
    final restaurantsResult = await getRestaurantsUsecase();
    restaurantsResult.fold(
      (failure) {
        emit(HomeError());
      },
      (success) {
        emit(HomeLoaded(restaurants: success));
      },
    );
  }
}
