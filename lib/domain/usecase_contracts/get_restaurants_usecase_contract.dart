import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class GetRestaurantsUsecaseContract {
  Future<List<Restaurant>> getRestaurants({
    bool forceFetch = false,
    int offset = 0,
  });
}
