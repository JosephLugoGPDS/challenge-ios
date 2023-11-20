
import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure,User>> login(String user, String password);
}
