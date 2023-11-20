import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:challenge/features/auth/domain/entities/user.dart';
import 'package:challenge/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, User>> login(String user, String password) async {
    
    try {
      final result = await dataSource.login(user, password);
      if (result.success) {
        return Right(result.responseObj as User);
      } else {
        return Left(FailureMessage(msg: result.message));
      }
    } catch (e) {
      return Left(FailureMessage(msg: "Login failed"));
    }
  }
}
