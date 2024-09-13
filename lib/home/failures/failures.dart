import 'error_handler_failure.dart';

abstract class RestaurantsFailure implements ErrorHandlerFailure {}

class APIRestaurantsFailure extends RestaurantsFailure {
  @override
  final String message;
  @override
  final FailureType type;
  @override
  final FailureDisplayType displayType;
  @override
  final String? title;
  @override
  final void Function()? onPress;

  APIRestaurantsFailure({
    required this.message,
    required this.type,
    required this.displayType,
    this.title,
    this.onPress,
  }) : super();
}

class GetCurrentLocationFailure extends RestaurantsFailure {
  @override
  final String message;
  @override
  FailureType get type => FailureType.error;
  @override
  FailureDisplayType get displayType => FailureDisplayType.toast;
  @override
  final String? title;
  @override
  final void Function()? onPress;

  GetCurrentLocationFailure({
    required this.message,
    this.title,
    this.onPress,
  }) : super();
}

class MovieFailure extends RestaurantsFailure {
  @override
  final String message;
  @override
  FailureType get type => FailureType.error;
  @override
  FailureDisplayType get displayType => FailureDisplayType.dialog;
  @override
  final String? title;
  @override
  final void Function()? onPress;

  MovieFailure({
    required this.message,
    this.title,
    this.onPress,
  }) : super();
}

class NetworkRestaurantsFailure extends RestaurantsFailure {
  @override
  FailureDisplayType get displayType => FailureDisplayType.toast;
  @override
  final String message;
  @override
  void Function()? get onPress => null;
  @override
  String? get title => null;
  @override
  FailureType get type => FailureType.warning;

  NetworkRestaurantsFailure({required this.message}) : super();
}

class SearchAddressesFailure extends RestaurantsFailure {
  @override
  final String message;
  @override
  FailureType get type => FailureType.error;
  @override
  FailureDisplayType get displayType => FailureDisplayType.toast;
  @override
  final String? title;
  @override
  final void Function()? onPress;

  SearchAddressesFailure({
    required this.message,
    this.title,
    this.onPress,
  }) : super();
}
