import 'package:restaurant_tour/core/domain/error/error.dart';

sealed class DataError extends BaseError {}

sealed class NetworkError extends DataError {}

final class NoInternetConnectionError extends NetworkError {}

final class TimeoutError extends NetworkError {}

final class ServerError extends NetworkError {}

final class UnknownError extends NetworkError {}

final class RateLimitError extends NetworkError {}
