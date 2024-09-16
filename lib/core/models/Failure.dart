import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode = 0,
  });

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.statusCode = null,
  });
}

class LocalFailure extends Failure {
  const LocalFailure({
    required super.message,
  });
}
