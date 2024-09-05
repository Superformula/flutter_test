import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/usecases/favorite/add_to_favorite_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/check_restaurant_favorited_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/remove_from_favorite_usecase.dart';
import 'package:state_management/presentation/sf_state.dart';

class RestaurantDetailsPresenter extends Cubit<SFState> {
  RestaurantDetailsPresenter(this.initialFavoriteValue)
      : currentFavoriteValue = initialFavoriteValue,
        super(SFInitialState());
  final bool initialFavoriteValue;

  final AddToFavoriteUseCase _addToFavoriteUseCase =
      SFInjector.instance.get<AddToFavoriteUseCase>();

  final RemoveFromFavoriteUseCase _removeFromFavoritesUseCase =
      SFInjector.instance.get<RemoveFromFavoriteUseCase>();

  final CheckRestaurantFavoritedUseCase _checkRestaurantFavoritedUseCase =
      SFInjector.instance.get<CheckRestaurantFavoritedUseCase>();

  bool currentFavoriteValue;

  Future<void> heartPressed(Restaurant restaurant) async {
    if (state is SFSuccessState) {
      restaurant.isFavorite
          ? await _unfavorite(restaurant)
          : await _favorite(restaurant);
      currentFavoriteValue = restaurant.isFavorite;
    }
  }

  Future<void> _favorite(Restaurant restaurant) async {
    if (state is SFSuccessState) {
      emit(SFLoadingState());
      _addToFavoriteUseCase.favorite(restaurant);
      restaurant.isFavorite = true;
      emit(SFSuccessState<bool>(object: true));
    }
  }

  Future<void> _unfavorite(Restaurant restaurant) async {
    emit(SFLoadingState());
    await _removeFromFavoritesUseCase.remove(restaurant);
    restaurant.isFavorite = false;
    emit(SFSuccessState<bool>(object: false));
  }

  Future<void> isRestaurantFavorite(Restaurant restaurant) async {
    emit(SFLoadingState());
    var isFavorited =
        await _checkRestaurantFavoritedUseCase.isFavorited(restaurant);
    restaurant.isFavorite = isFavorited;
    emit(SFSuccessState<bool>(object: isFavorited));
  }

  bool mustRefresh() => initialFavoriteValue != currentFavoriteValue;
}
