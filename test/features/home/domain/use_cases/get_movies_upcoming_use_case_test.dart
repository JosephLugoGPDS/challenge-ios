import 'package:challenge/core/errors/failures.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:challenge/features/home/domain/use_cases/get_movies_upcoming_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMoviesUpcomingUseCaseTest extends Mock
    implements GetMoviesUpcomingUseCase {
  bool mockResponse = false;

  @override
  Future<Either<Failure, List<Movie>>> call(String locale, int page) async {
    if (mockResponse) {
      return const Right(<Movie>[]);
    } else {
      return Left(FailureMessage(msg: 'Error'));
    }
  }
}

void main() {
  late GetMoviesUpcomingUseCaseTest useCase;
  setUp(() {
    useCase = GetMoviesUpcomingUseCaseTest();
  });

  test('should return a list of movies', () async {
    useCase.mockResponse = true;
    final result = await useCase.call('en-US', 1);
    expect(result, const Right(<Movie>[]));
  });

  test('should return a Failure', () async {
    useCase.mockResponse = false;
    final result = await useCase.call('en-US', 1);
    expect(result, Left(FailureMessage(msg: 'Error')));
  });
}
