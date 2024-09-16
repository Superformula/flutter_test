import '../../../domain/entities/entities.dart';

abstract class RestaurantTourPresenter {
  List<RestaurantEntity> get restaurantList;
  Future<void> getAllRestaurants();
  List<FavoriteRestaurantEntity> get favoriteRestaurantList;
  Future<void> getFavoriteRestaurants();
  Future<void> addFavoriteRestaurants(RestaurantEntity restaurant);
}
