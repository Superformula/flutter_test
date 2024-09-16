import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/restaurant_model.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/domain/repository/favorite_restaurant_respository.dart';

part 'favorite_restaurants_event.dart';
part 'favorite_restaurants_state.dart';

class FavoriteRestaurantsBloc
    extends Bloc<FavoriteRestaurantsEvent, FavoriteRestaurantsState> {
  FavoriteRestaurantsBloc({
    required this.hiveHelper,
    required this.favoriteRestaurantsRepository,
  }) : super(FavoriteRestaurantsInitial()) {
    on<InitialEvent>(_onInitialEvent);
  }

  final HiveHelper hiveHelper;
  final FavoriteRestaurantsRepository favoriteRestaurantsRepository;

  Future<void> _onInitialEvent(
      InitialEvent event,
      Emitter<FavoriteRestaurantsState> emit,
      ) async {
    emit(const LoadingState());

    final favoriteList = hiveHelper.getAllFavoriteIds();
    List<RestaurantModel> favoriteRestaurants = [];

    if (favoriteList.isEmpty) {
      emit(const NoFavoritesState());
      return;
    }

    for (var restaurantId in favoriteList) {
      final response = await favoriteRestaurantsRepository.getRestaurantDetails(
        restaurantId: restaurantId,
      );

      response.when(
        ok: (restaurant) {
          favoriteRestaurants.add(restaurant);
        },
        err: (err) {
          print(err);
          return;
        },
      );
    }

    emit(FavoriteRestaurantsLoaded(favoriteList: favoriteRestaurants));
  }
}