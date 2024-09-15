import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';

abstract class BaseRestaurantLocalDataSource {
  Future<Result<List<Restaurant>, BaseError>> getRestaurants();

  Future<Result<void, BaseError>> insertRestaurants(
    List<Restaurant> restaurants,
  );

  Future<Result<void, BaseError>> toggleFavorite(
    Restaurant restaurant,
  );

  Stream<List<Restaurant>> getFavorites();
}
