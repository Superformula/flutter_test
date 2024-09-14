import 'package:restaurant_tour/data/models/restaurant.dart';

abstract class FavoritesLocalStorageContract {
  Future<List<Restaurant>> getFavorites();
  Future<void> saveFavorite(Restaurant restaurant);
  Future<void> removeFavorite(Restaurant restaurant);
}
