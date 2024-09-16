import 'package:dio/dio.dart';
import 'package:oxidized/oxidized.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/restaurant_model.dart';

abstract class FavoriteRestaurantsRepository {
  Future<Result<RestaurantModel, DioException>> getRestaurantDetails({
    required String restaurantId,
  });
}