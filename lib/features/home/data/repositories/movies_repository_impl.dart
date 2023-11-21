import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/home/data/datasource/movies_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:challenge/features/home/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesRepositoryImpl({required this.dataSource});
  final MoviesRemoteDataSource dataSource;
  @override
  Future<Either<Failure, List<Movie>>> getMoviesUpcoming(
      String locale, int page) async {
    try {
      final result = await dataSource.getMoviesFromNetwork(locale, page);
      if (result.success) {
        return Right(result.responseObj as List<Movie>);
      } else {
        return Left(FailureMessage(msg: result.message));
      }
    } catch (e) {
      return Left(FailureMessage(msg: "Movies failed"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(
      String query, String locale, int page) async {
    try {
      final result = await dataSource.getSearchMovies(locale, page, query);
      if (result.success) {
        return Right(result.responseObj as List<Movie>);
      } else {
        return Left(FailureMessage(msg: result.message));
      }
    } catch (e) {
      return Left(FailureMessage(msg: "Movies Search failed"));
    }
  }
}
