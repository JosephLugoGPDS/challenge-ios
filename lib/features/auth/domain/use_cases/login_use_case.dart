import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/auth/domain/entities/user.dart';
import 'package:challenge/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, User>> call({required String user, required String password}) async {
    return await authRepository.login(user, password);
  }
}
