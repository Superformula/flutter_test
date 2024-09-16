abstract class RestaurantsFailure {
  final String message;

  RestaurantsFailure({required this.message});
}

class RestaurantFailure extends RestaurantsFailure {
  @override
  final String message;

  RestaurantFailure({
    required this.message,
  }) : super(message: message);
}
