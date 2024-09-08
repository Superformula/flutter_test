import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
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
  })  : offset = 0,
        super(const RestaurantViewModel.empty());

  final GetRestaurantReviewsUseCase getRestaurantReviewsUseCase;
  final ListRestaurantsUseCase listRestaurantsUseCase;

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
}
