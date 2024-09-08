import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_tour/domain/favorite_restaurant_use_case.dart';
import 'package:restaurant_tour/domain/get_restaurant_reviews.dart';
import 'package:restaurant_tour/domain/list_restaurants_use_case.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';

part 'restaurant_view_controller.freezed.dart';

@freezed
class RestaurantViewModel with _$RestaurantViewModel {
  const factory RestaurantViewModel.loading() = RestaurantViewModelLoading;
  const factory RestaurantViewModel.empty() = RestaurantViewModelEmpty;

  const factory RestaurantViewModel.data({
    required List<RestaurantData> restaurants,
  }) = RestaurantViewModelData;

  const factory RestaurantViewModel.reviews({
    required List<RestaurantReviewData> reviews,
  }) = RestaurantViewModelReviews;

  const factory RestaurantViewModel.favorites({
    required List<RestaurantData> favorites,
  }) = RestaurantViewModelFavorites;

  const factory RestaurantViewModel.error({
    required Object? error,
    required StackTrace stackTrace,
  }) = RestaurantViewModelError;
}

final class RestaurantViewController extends Cubit<RestaurantViewModel> {
  RestaurantViewController({
    required this.getRestaurantReviewsUseCase,
    required this.listRestaurantsUseCase,
    required this.favoritesRestaurantsUseCase,
  })  : offset = 0,
        super(const RestaurantViewModel.empty());

  final GetRestaurantReviewsUseCase getRestaurantReviewsUseCase;
  final ListRestaurantsUseCase listRestaurantsUseCase;
  final FavoritesRestaurantsUseCase favoritesRestaurantsUseCase;

  int offset;

  static final _logger = Logger('RestaurantViewController');

  Future<void> getRestaurants() async {
    try {
      emit(const RestaurantViewModel.loading());
      final restaurants = await listRestaurantsUseCase.call(offset: offset);
      offset = offset + 1;
      emit(RestaurantViewModel.data(restaurants: restaurants));
    } catch (error, stackTrace) {
      _logger.severe('Fail to load restaurants data when using offset $offset', error, stackTrace);
      emit(RestaurantViewModel.error(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> getRestaurantReviews({required String restaurantId}) async {
    try {
      emit(const RestaurantViewModel.loading());
      final reviews = await getRestaurantReviewsUseCase.call(restaurantId: restaurantId);
      emit(RestaurantViewModel.reviews(reviews: reviews));
    } catch (error, stackTrace) {
      _logger.severe('Fail to get restaurant reviews for id $restaurantId', error, stackTrace);
      emit(RestaurantViewModel.error(error: error, stackTrace: stackTrace));
    }
  }

  Future<void> getFavoriteRestaurants() async {
    emit(RestaurantViewModel.favorites(favorites: favoritesRestaurantsUseCase.favorites));
  }

  Future<void> favoritateRestaurant({required int offset, required String restaurantId, bool isFavorite = false}) async {
    try {
      await favoritesRestaurantsUseCase.call(restaurantId: restaurantId, offset: offset, isFavorite: isFavorite);
      emit(RestaurantViewModel.favorites(favorites: favoritesRestaurantsUseCase.favorites));
    } catch (error, stackTrace) {
      _logger.severe('Fail to select restaurant $restaurantId as favorite', error, stackTrace);
      emit(RestaurantViewModel.error(error: error, stackTrace: stackTrace));
    }
  }
}
