// coverage:ignore-file

enum FetchAppError { notFound, serverError, unknowError, networkError }

class AppException implements Exception {
  final FetchAppError error;
  final String message;

  AppException(this.error, this.message);

  @override
  String toString() => 'AppException: $message';
}
