import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

import '../../core/domain/error/data_error.dart';
import '../../core/domain/error/error.dart';

abstract class BaseRestaurantsRepository {
  const BaseRestaurantsRepository();

  Future<Result<List<Restaurant>, BaseError>> getRestaurants({int offset = 0});

  Stream<List<Restaurant>> getFavorites();

  void toggleFavorite(Restaurant restaurant);

  void dispose();
}
