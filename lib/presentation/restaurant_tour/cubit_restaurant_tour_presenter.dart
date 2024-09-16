import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

part 'states.dart';

class CubitRestaurantTourPresenter extends Cubit<RestaurantState> implements RestaurantTourPresenter {
  final GetRestaurants _getRestaurants;

  CubitRestaurantTourPresenter({required GetRestaurants getRestaurants})
      : _getRestaurants = getRestaurants,
        super(RestaurantInitialState()) {
    getAllRestaurants();
  }

  final _restaurantList = <RestaurantEntity>[];

  @override
  List<RestaurantEntity> get restaurantList => _restaurantList;

  @override
  Future<void> getFavoriteRestaurants() {
    // TODO: implement getFavoriteRestaurants
    throw UnimplementedError();
  }

  @override
  Future<void> getAllRestaurants() async {
    try {
      emit(RestaurantLoadingState());
      _restaurantList.addAll(await _getRestaurants());
      emit(RestaurantSuccessState());
    } catch (e, s) {
      debugPrintStack(label: 'Error - $e', stackTrace: s);
      emit(RestaurantErrorState('There was an error \nwhen get restaurants.'));
    }
  }

  void dispose() {
    _restaurantList.clear();
  }
}
