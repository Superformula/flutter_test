/// Exception thrown when the request throws a 404 error.
class RestaurantCustomException implements Exception {
  /// The error object related to the exception.
  final Object error;

  /// An optional message describing the exception.
  final String message;

  /// Constructor that takes an [error] object and an optional [message] string.
  RestaurantCustomException({required this.error, String? message})
      : message = message ?? 'An unexpected exception occurred';

  @override
  String toString() {
    return 'RestaurantCustomException: $message, Error: $error';
  }
}
