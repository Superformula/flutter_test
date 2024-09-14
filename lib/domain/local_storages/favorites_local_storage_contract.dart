import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class FavoritesLocalStorageContract {
  Future<List<Restaurant>> getFavorites();
  Future<void> saveFavorite(Restaurant restaurant);
  Future<void> removeFavorite(Restaurant restaurant);
}
