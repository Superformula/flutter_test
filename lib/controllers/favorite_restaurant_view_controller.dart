import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_tour/domain/favorite_restaurant_use_case.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';

part 'favorite_restaurant_view_controller.freezed.dart';

@freezed
class FavoriteRestaurantViewModel with _$FavoriteRestaurantViewModel {
  const factory FavoriteRestaurantViewModel.loading() = FavoriteRestaurantViewModelLoading;
  const factory FavoriteRestaurantViewModel.empty() = FavoriteRestaurantViewModelEmpty;

  const factory FavoriteRestaurantViewModel.data({
    required List<RestaurantData> favorites,
  }) = FavoriteRestaurantViewModelData;

  const factory FavoriteRestaurantViewModel.error({
    required Object? error,
    required StackTrace stackTrace,
  }) = FavoriteRestaurantViewModelError;
}

final class FavoriteRestaurantViewController extends Cubit<FavoriteRestaurantViewModel> {
  FavoriteRestaurantViewController({
    required this.favoritesRestaurantsUseCase,
  }) : super(const FavoriteRestaurantViewModel.empty());

  static final _logger = Logger('FavoriteRestaurantViewController');

  final FavoritesRestaurantsUseCase favoritesRestaurantsUseCase;

  Future<void> getFavoriteRestaurants() async {
    emit(FavoriteRestaurantViewModel.data(favorites: favoritesRestaurantsUseCase.favorites));
  }

  RestaurantData? getSingleFavoriteRestaurant({required String restaurantId}) {
    return favoritesRestaurantsUseCase.getSingleFavoriteRestaurant(restaurantId: restaurantId);
  }

  Future<void> favoritateRestaurant({required String restaurantId, required int offset, bool isFavorite = false}) async {
    try {
      await favoritesRestaurantsUseCase.call(restaurantId: restaurantId, offset: offset, isFavorite: isFavorite);
      emit(FavoriteRestaurantViewModel.data(favorites: favoritesRestaurantsUseCase.favorites));
    } catch (error, stackTrace) {
      _logger.severe('Fail to select restaurant $restaurantId as favorite', error, stackTrace);
      emit(FavoriteRestaurantViewModel.error(error: error, stackTrace: stackTrace));
    }
  }
}
