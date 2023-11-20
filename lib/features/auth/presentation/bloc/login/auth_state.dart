part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthSuccessState extends AuthState {
  final UserModel user;

  const AuthSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {
  final String errorMessage;

  const AuthFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
