import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';

import 'state.dart';

/// The [Cubit] that manages the general state of the [RestaurantsListscreen].
final class RestaurantsListScreenCubit extends Cubit<RestaurantsListScreenState> {
  /// Creates a new [RestaurantsListsScreenCubit].
  ///
  /// A [repository] is mandatory, from which the cubit will fetch the data.
  RestaurantsListScreenCubit({
    required RestaurantsRepository repository,
  })  : _repository = repository,
        super(const RestaurantsListData());

  final RestaurantsRepository _repository;

  /// Loads data from the repository and updates the state accordingly.
  Future<void> loadRestaurants() async {
    emit(const RestaurantsListLoading());

    try {
      final data = await _repository.getRestaurants();
      final restaurants = data?.restaurants ?? [];

      emit(
        RestaurantsListData(restaurants: restaurants),
      );
    } on Exception catch (error, stackTrace) {
      emit(
        RestaurantsListError(
          exception: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
