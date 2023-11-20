part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class GetLoginEvent extends AuthEvent {
  final String username;
  final String password;

  GetLoginEvent(this.username, this.password);
}

class AuthCheckEvent extends AuthEvent {
  const AuthCheckEvent();
}
