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
