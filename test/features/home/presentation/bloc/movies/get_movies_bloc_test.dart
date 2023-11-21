import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/home/data/model/movie_model.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:challenge/features/home/domain/use_cases/get_movies_upcoming_use_case.dart';
import 'package:challenge/features/home/presentation/bloc/movies/get_movies_bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMoviesUpcomingUseCaseTest extends Mock
    implements GetMoviesUpcomingUseCase {
  bool mockResponse = false;

  @override
  Future<Either<Failure, List<Movie>>> call(String locale, int page) async {
    if (mockResponse) {
      return const Right(<MovieModel>[]);
    } else {
      return Left(FailureMessage(msg: 'Error'));
    }
  }
}

void main() {
  group('GetMoviesUpcoming', () {
    late GetMoviesUpcomingUseCaseTest useCase;
    setUp(() {
      useCase = GetMoviesUpcomingUseCaseTest();
    });

    blocTest<GetMoviesBloc, GetMoviesState>(
      'should return a list of movies',
      build: () => GetMoviesBloc(getMoviesUpcoming: useCase),
      act: (bloc) {
        useCase.mockResponse = true;
        bloc.add(const FetchMovies(locale: 'en-US', page: 1));
      },
      expect: () => [
        const GetMoviesLoading(),
        const GetMoviesSuccess(movies: []),
      ],
    );

    blocTest<GetMoviesBloc, GetMoviesState>(
      'should return a Failure',
      build: () => GetMoviesBloc(getMoviesUpcoming: useCase),
      act: (bloc) {
        useCase.mockResponse = false;
        bloc.add(const FetchMovies(locale: 'en-US', page: 1));
      },
      expect: () =>
          [const GetMoviesLoading(), const GetMoviesFailure(message: 'Error')],
    );
  });
}
