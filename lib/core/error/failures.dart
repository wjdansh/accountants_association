import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  late String message;

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  @override
  String message;

  ServerFailure({required this.message});
}

class ResponseFailure extends Failure {
  @override
  String message;

  ResponseFailure({required this.message});
}
