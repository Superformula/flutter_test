import 'package:restaurant_tour/models/models.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

class FetchRestaurants {
  final YelpRepository repository;

  FetchRestaurants({required this.repository});
  Future<RestaurantQueryResult?> getRestaurants() async =>
      await repository.getRestaurants();
  Future<RestaurantQueryResult?> getRestaurantsFromCache() async =>
      await repository.getRestaurantsFromCache();
}
