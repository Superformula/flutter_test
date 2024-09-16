class AppException implements Exception {
  String code;
  String description;
  AppException(this.code, this.description);
  @override
  String toString() {
    return {
      'code': code,
      'description': description,
    }.toString();
  }
}

class RestaurantNotFoundException extends AppException {
  RestaurantNotFoundException({
    code = "RESTAURANT_NOT_FOUND",
    description = "The restaurant searched is not our dataset",
  }) : super(code, description);
}

class RestaurantListException extends AppException {
  RestaurantListException({
    code = "RESTAURANTS_LIST_NOT_AVAILABLE",
    description = "The restaurant is not available at the moment",
  }) : super(code, description);
}

class FavoritesRestaurantsListException extends AppException {
  FavoritesRestaurantsListException({
    code = "FAVORITES_RESTAURANTS_LIST_NOT_AVAILABLE",
    description = "The favorite restaurant is not available at the moment",
  }) : super(code, description);
}

class AddFavoriteRestaurantException extends AppException {
  AddFavoriteRestaurantException({
    code = "ADD_FAVORITE_RESTAURANT_EXCEPTION",
    description = "Couldn't register the favorite restaurant",
  }) : super(code, description);
}

class RemoveFavoriteRestaurantException extends AppException {
  RemoveFavoriteRestaurantException({
    code = "REMOVE_FAVORITE_RESTAURANT_EXCEPTION",
    description = "Couldn't remove the favorite restaurant",
  }) : super(code, description);
}
