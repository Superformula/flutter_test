import '../../../domain/entities/entities.dart';

abstract class RestaurantTourPresenter {
  List<RestaurantEntity> get restaurantList;
  Future<void> getAllRestaurants();
  Future<void> getFavoriteRestaurants();
}
