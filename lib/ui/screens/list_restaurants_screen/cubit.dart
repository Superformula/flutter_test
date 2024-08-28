import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/ui/screens/list_restaurants_screen/state.dart';

final class ListRestaurantsScreenCubit extends Cubit<ListRestaurantsScreenState> {
  ListRestaurantsScreenCubit({
    required this.repository,
  }) : super(const RestaurantsData());

  final RestaurantsRepository repository;

  Future<void> loadRestaurants() async {
    emit(const LoadingRestaurants());

    try {
      final data = await repository.getRestaurants();
      final restaurants = data?.restaurants ?? [];
      
      emit(
        RestaurantsData(restaurants: restaurants),
      );
    } on Exception catch (error, stackTrace) {
      emit(
        RestaurantsError(
          exception: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
