import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';

import 'package:restaurant_tour/core/domain/error/error.dart';

abstract class BaseRestaurantRemoteDataSource {
  Future<Result<List<Restaurant>, BaseError>> getRestaurants({
    int offset = 0,
  });
}
