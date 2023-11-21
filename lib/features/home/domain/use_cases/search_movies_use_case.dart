import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:challenge/features/home/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMoviesUseCase {
  final MoviesRepository repository;

  SearchMoviesUseCase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(
      String query, String locale, int page) async {
    return await repository.searchMovies(query, locale, page);
  }
}
