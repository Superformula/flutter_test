import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/domain/usecases/get_restaurants.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

part 'states.dart';

class CubitRestaurantTourPresenter extends Cubit<RestaurantState> implements RestaurantTourPresenter {
  final GetRestaurants _getRestaurants;
  final GetFavoriteRestaurants _getFavoriteRestaurants;

  CubitRestaurantTourPresenter({
    required GetRestaurants getRestaurants,
    required GetFavoriteRestaurants getFavoriteRestaurants,
  })  : _getRestaurants = getRestaurants,
        _getFavoriteRestaurants = getFavoriteRestaurants,
        super(RestaurantInitialState()) {
    _load();
  }

  void _load() {
    getAllRestaurants();
    getFavoriteRestaurants();
  }

  final _restaurantList = <RestaurantEntity>[];
  final _favoriteRestaurantList = <FavoriteRestaurantEntity>[];

  @override
  List<RestaurantEntity> get restaurantList => _restaurantList;

  @override
  List<FavoriteRestaurantEntity> get favoriteRestaurantList => _favoriteRestaurantList;

  @override
  Future<void> getFavoriteRestaurants() async {
    try {
      emit(RestaurantLoadingState());
      _favoriteRestaurantList.addAll(await _getFavoriteRestaurants());
      emit(RestaurantSuccessState());
    } catch (e, s) {
      debugPrintStack(label: 'Error - getFavoriteRestaurants - $e', stackTrace: s);
      emit(RestaurantErrorState('There was an error \nwhen get favorite restaurants.'));
    }
  }

  @override
  Future<void> getAllRestaurants() async {
    try {
      emit(RestaurantLoadingState());
      _restaurantList.addAll(await _getRestaurants());
      emit(RestaurantSuccessState());
    } catch (e, s) {
      debugPrintStack(label: 'Error - getAllRestaurants - $e', stackTrace: s);
      emit(RestaurantErrorState('There was an error \nwhen get restaurants.'));
    }
  }

  void dispose() {
    _restaurantList.clear();
    _favoriteRestaurantList.clear();
  }
}
