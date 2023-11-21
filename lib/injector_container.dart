import 'package:challenge/app/data/datasources/api_client.dart';
import 'package:challenge/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:challenge/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:challenge/features/auth/domain/repository/auth_repository.dart';
import 'package:challenge/features/auth/domain/use_cases/use_cases.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:challenge/features/home/data/datasource/movies_remote_datasource.dart';
import 'package:challenge/features/home/data/repositories/movies_repository_impl.dart';
import 'package:challenge/features/home/domain/repositories/movies_repository.dart';
import 'package:challenge/features/home/domain/use_cases/get_movies_upcoming_use_case.dart';
import 'package:challenge/features/home/presentation/bloc/bloc/get_movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {}
Future<void> featAuth() async {
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(login: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: sl()));
}

Future<void> featHome() async {
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(apiClient: sl()));
  sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<GetMoviesUpcomingUseCase>(
      () => GetMoviesUpcomingUseCase(repository: sl()));
  sl.registerFactory<GetMoviesBloc>(
      () => GetMoviesBloc(getMoviesUpcoming: sl()));
}

Future<void> initApiClient() async {
  final apiClient = ApiClient();
  sl.registerLazySingleton(() => apiClient);
}
