
import 'package:challenge/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:challenge/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:challenge/features/auth/domain/repository/auth_repository.dart';
import 'package:challenge/features/auth/domain/use_cases/use_cases.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
}
Future<void> featAuth() async {
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(login: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
}
