import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class BaseRestaurantsRepository {
  const BaseRestaurantsRepository();

  Future<List<Restaurant>?> getRestaurants({int offset = 0});

  Stream<List<Restaurant>> getFavorites();

  void toggleFavorite(Restaurant restaurant);

  void dispose();
}
