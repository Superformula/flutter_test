class AppException implements Exception {
  final String? message;

  AppException({this.message});
}

class ServerException implements Exception {
  final String? message;

  ServerException({this.message});
}
