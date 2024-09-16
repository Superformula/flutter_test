import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

part 'states.dart';

class CubitRestaurantTourPresenter extends Cubit<RestaurantState> implements RestaurantTourPresenter {
  final GetRestaurants _getRestaurants;
  final GetFavoriteRestaurants _getFavoriteRestaurants;
  final SaveFavoriteRestaurants _saveFavoriteRestaurants;

  CubitRestaurantTourPresenter({
    required GetRestaurants getRestaurants,
    required GetFavoriteRestaurants getFavoriteRestaurants,
    required SaveFavoriteRestaurants saveFavoriteRestaurants,
  })  : _getRestaurants = getRestaurants,
        _getFavoriteRestaurants = getFavoriteRestaurants,
        _saveFavoriteRestaurants = saveFavoriteRestaurants,
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

  @override
  Future<void> addFavoriteRestaurants() async {
    try {
      _saveFavoriteRestaurants(_favoriteRestaurantList);
    } catch (e, s) {
      debugPrintStack(label: 'Error - addFavoriteRestaurants - $e', stackTrace: s);
    }
  }

  void dispose() {
    _restaurantList.clear();
    _favoriteRestaurantList.clear();
  }
}
