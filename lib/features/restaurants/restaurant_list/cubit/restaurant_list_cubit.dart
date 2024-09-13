import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/app/app.dart';

part 'restaurant_list_state.dart';

/// [RestaurantListCubit] is responsible for managing the state of the restaurant list.
///
/// It communicates with the [RestaurantRepository] to fetch restaurant data and
/// emits different states depending on the process of fetching the restaurants.
///
/// ### States:
/// - [RestaurantListInitial]: The initial state when no data has been fetched yet.
/// - [RestaurantListLoading]: Emitted when the restaurants are being fetched from the repository.
/// - [RestaurantListLoaded]: Emitted when the list of restaurants is successfully fetched and available.
/// - [RestaurantListError]: Emitted when an error occurs during the fetching process.
///
/// ### Usage:
/// - To fetch restaurants, the [getRestaurants] method is called.
/// - The cubit emits different states based on the success or failure of the data fetching.
class RestaurantListCubit extends Cubit<RestaurantListState> {
  /// The repository responsible for fetching restaurant data.
  final RestaurantRepository restaurantRepository;

  /// Constructor for [RestaurantListCubit].
  ///
  /// Requires a [RestaurantRepository] to interact with the restaurant data source.
  /// The initial state is [RestaurantListInitial].
  RestaurantListCubit({required this.restaurantRepository})
      : super(RestaurantListInitial());

  /// Fetches a list of restaurants from the repository.
  ///
  /// This method starts by emitting the [RestaurantListLoading] state.
  /// Then it calls [restaurantRepository.fetchRestaurants] to get the list of restaurants.
  ///
  /// If successful, it emits [RestaurantListLoaded] with the fetched list.
  /// If an error occurs, it emits [RestaurantListError] with an error message.
  ///
  /// [offset] is an optional parameter for pagination, defaulting to 0.
  Future<void> getRestaurants({int offset = 0}) async {
    try {
      // Emit loading state while fetching restaurants
      emit(RestaurantListLoading());

      // Fetch restaurants from repository
      final restaurants =
          await restaurantRepository.fetchRestaurants(offset: offset);

      // Emit loaded state with fetched restaurants
      emit(RestaurantListLoaded(restaurants: restaurants));
    } on RestaurantCustomException catch (exception) {
      // Emit error state with custom exception message
      emit(RestaurantListError(errorMessage: exception.message));
    } on Exception catch (exception) {
      // Emit error state with generic exception message
      emit(RestaurantListError(errorMessage: exception.toString()));
    }
  }
}
