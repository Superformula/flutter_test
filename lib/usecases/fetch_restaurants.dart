import 'package:restaurant_tour/models/models.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

class FetchRestaurants {
  final YelpRepository repository;

  FetchRestaurants({required this.repository});
  Future<RestaurantQueryResult?> getRestaurants() async => await repository
      .getRestaurantsFromCache(); //CHANGE THIS LATER TO FETCH FROM THE REAL API

  Future<RestaurantQueryResult?> getRestaurantsFromCache() async =>
      await repository.getRestaurantsFromCache();

  Future<List<String>> getFavoriteRestaurants() async {
    // Simulate delay
    await Future.delayed(const Duration(milliseconds: 500));

    return ['vHz2RLtfUMVRPFmd7VBEHA'];
  }
}
