class ServerException implements Exception {}

class ResponseException implements Exception {
  String message;

  ResponseException({required this.message});
}
