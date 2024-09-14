import 'package:restaurant_tour/domain/models/restaurant.dart';

abstract class FavoritesUsecaseContract {
  Future<List<Restaurant>> getFavorites();
  Future<void> saveFavorite(Restaurant restaurant);
  Future<void> removeFavorite(Restaurant restaurant);
  Future<bool> isFavorite(Restaurant restaurant);
}
