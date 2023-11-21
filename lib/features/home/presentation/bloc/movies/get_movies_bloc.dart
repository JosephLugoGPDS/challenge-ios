import 'package:challenge/features/home/domain/use_cases/get_movies_upcoming_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/features/home/data/model/movie_model.dart';
import 'package:equatable/equatable.dart';

part 'get_movies_event.dart';
part 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  GetMoviesBloc({
    required GetMoviesUpcomingUseCase getMoviesUpcoming,
  })  : _getMoviesUpcoming = getMoviesUpcoming,
        super(const GetMoviesInitial()) {
    on<FetchMovies>(_onFetchMovies);
  }

  final GetMoviesUpcomingUseCase _getMoviesUpcoming;

  void _onFetchMovies(FetchMovies event, Emitter<GetMoviesState> emit) async {
    emit(const GetMoviesLoading());
    final result = await _getMoviesUpcoming(event.locale, event.page);
    result.fold(
      (failure) => emit(GetMoviesFailure(message: failure.message)),
      (movies) => emit(GetMoviesSuccess(movies: movies as List<MovieModel>)),
    );
  }
}
