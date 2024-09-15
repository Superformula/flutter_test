import 'package:restaurant_tour/core/domain/error/error.dart';

sealed class DataError extends BaseError {}

sealed class NetworkError extends DataError {}

sealed class LocalError extends DataError {}

// network errors
final class NoInternetConnectionError extends NetworkError {}

final class TimeoutError extends NetworkError {}

final class ServerError extends NetworkError {}

final class RateLimitError extends NetworkError {}

// local errors
final class ReadLocalDataError extends LocalError {}

final class SaveDataError extends LocalError {}

// adding override only in this class to help with tests
// just an example as I need to compare the result of an error in a test
final class UnknownError extends NetworkError {
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnknownError;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}
