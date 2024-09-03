abstract class Failure {
  final String? message;

  Failure({this.message});
}

class ServerFailure extends Failure {}

class AppFailure extends Failure {}
