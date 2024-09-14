import 'package:restaurant_tour/data/models/restaurant.dart';

abstract class GetRestaurantsUsecaseContract {
  Future<List<Restaurant>> getRestaurants({bool forceFetch = false});
}
