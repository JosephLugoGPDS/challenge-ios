
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  String get message;
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message => throw UnimplementedError();
}

class NotConnectedFailure extends Failure {
  @override
  String get message => 'No internet connection';
}

class UnauthorizeFailure extends Failure {
  @override
  String get message => 'unauthorize';
}

class UnknownFailure extends Failure {
  @override
  String get message => '[UNKNOWN]';
}
 
class FailureMessage extends Failure {
  FailureMessage({required this.msg});
  final String msg;
  @override
  String get message => msg;
}