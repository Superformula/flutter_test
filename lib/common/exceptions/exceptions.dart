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
    code = "Restaurant not found",
    description = "The restaurant searched is not our dataset",
  }) : super(code, description);
}
