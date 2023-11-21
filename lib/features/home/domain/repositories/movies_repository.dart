import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMoviesUpcoming(
      String locale, int page);
  Future<Either<Failure, List<Movie>>> searchMovies(
      String query, String locale, int page);
}
