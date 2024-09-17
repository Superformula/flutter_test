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
    _loadData();
  }

  Future<void> _loadData() async {
    await getFavoriteRestaurants();
    await getAllRestaurants();
    _matchFavoriteRestaurants();
  }

  void _matchFavoriteRestaurants() {
    for (var favoriteRestaurant in _favoriteRestaurantList) {
      final index = _restaurantList.indexWhere((restaurant) => restaurant.id == favoriteRestaurant.id);
      if (index != -1) _restaurantList[index] = favoriteRestaurant;
    }
  }

  void _updateRestaurantAsFavorite(
    RestaurantEntity restaurant,
    FavoriteRestaurantEntity favoriteRestaurant,
  ) {
    final index = _restaurantList.indexOf(restaurant);
    _restaurantList[index] = favoriteRestaurant;
    _favoriteRestaurantList.add(favoriteRestaurant);
  }

  void _removeFavoriteRestaurant(
    RestaurantEntity restaurant,
    FavoriteRestaurantEntity favoriteRestaurant,
  ) {
    final index = _restaurantList.indexOf(favoriteRestaurant);
    if (index != -1) _restaurantList[index] = restaurant;
    _favoriteRestaurantList.remove(favoriteRestaurant);
  }

  RestaurantEntity _makeRestaurantFromFavoriteRestaurant(
    FavoriteRestaurantEntity favoriteRestaurant,
  ) {
    return RestaurantEntity(
      id: favoriteRestaurant.id,
      categories: favoriteRestaurant.categories,
      isOpen: favoriteRestaurant.isOpen,
      address: favoriteRestaurant.address,
      name: favoriteRestaurant.name,
      photos: favoriteRestaurant.photos,
      price: favoriteRestaurant.price,
      rating: favoriteRestaurant.rating,
      reviews: favoriteRestaurant.reviews,
    );
  }

  FavoriteRestaurantEntity _makeFavoriteRestaurantFromRestaurant(
    RestaurantEntity restaurant,
  ) {
    return FavoriteRestaurantEntity(
      id: restaurant.id,
      categories: restaurant.categories,
      isOpen: restaurant.isOpen,
      address: restaurant.address,
      name: restaurant.name,
      photos: restaurant.photos,
      price: restaurant.price,
      rating: restaurant.rating,
      reviews: restaurant.reviews,
    );
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
    } catch (_) {
      emit(RestaurantErrorState('Error loading favorite restaurants. Please try again later.'));
    }
  }

  @override
  Future<void> getAllRestaurants() async {
    try {
      emit(RestaurantLoadingState());
      _restaurantList.addAll(await _getRestaurants());
      emit(RestaurantSuccessState());
    } catch (_) {
      emit(RestaurantErrorState('Oops! We had trouble finding the restaurants.'));
    }
  }

  @override
  Future<void> addFavoriteRestaurant(RestaurantEntity restaurant) async {
    try {
      final favoriteRestaurant = _makeFavoriteRestaurantFromRestaurant(restaurant);
      _updateRestaurantAsFavorite(restaurant, favoriteRestaurant);
      await _saveFavoriteRestaurants(_favoriteRestaurantList);
    } catch (_) {
      emit(RestaurantErrorState('Error fetching restaurants. Try again later.'));
    }
  }

  @override
  Future<void> removeFavoriteRestaurant(FavoriteRestaurantEntity favoriteRestaurant) async {
    try {
      final restaurant = _makeRestaurantFromFavoriteRestaurant(favoriteRestaurant);
      _removeFavoriteRestaurant(restaurant, favoriteRestaurant);
      await _saveFavoriteRestaurants(_favoriteRestaurantList);
      emit(RestaurantSuccessState());
    } catch (_) {
      emit(RestaurantErrorState('Oops! There was an issue removing the restaurant from your favorites.'));
    }
  }
}
