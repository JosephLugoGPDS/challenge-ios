import 'package:challenge/features/auth/domain/use_cases/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/features/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required LoginUseCase login,
  })  : _login = login,
        super(const AuthInitialState()) {
    on<GetLoginEvent>(_onLoginEvent);
    on<AuthCheckEvent>(_onAuthCheckEvent);
  }
  final LoginUseCase _login;

  void _onLoginEvent(GetLoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    final result = await _login(user: event.username, password: event.password);
    result.fold(
      (failure) => emit(AuthFailureState(errorMessage: failure.message)),
      (user) => emit(AuthSuccessState(user: user as UserModel)),
    );
  }

  void _onAuthCheckEvent(AuthCheckEvent event, Emitter<AuthState> emit) async {
    if (state is AuthSuccessState) {
      final user = (state as AuthSuccessState).user;
      emit(const AuthLoadingState());
      emit(AuthSuccessState(user: user));
    } else {
      emit(const AuthFailureState(errorMessage: 'Not logged in'));
    }
  }
}
