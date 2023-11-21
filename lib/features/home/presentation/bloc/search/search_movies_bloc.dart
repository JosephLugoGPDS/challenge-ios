import 'package:challenge/features/home/domain/use_cases/search_movies_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/features/home/data/model/movie_model.dart';
import 'package:equatable/equatable.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc({
    required SearchMoviesUseCase searchMoviesUpcoming,
  })  : _searchMoviesUpcoming = searchMoviesUpcoming,
        super(const SearchMoviesInitial()) {
    on<FetchSearchMovies>(_onFetchSearchMovies);
  }

  final SearchMoviesUseCase _searchMoviesUpcoming;

  void _onFetchSearchMovies(
      FetchSearchMovies event, Emitter<SearchMoviesState> emit) async {
    emit(const SearchMoviesLoading());
    final result = await _searchMoviesUpcoming(
      event.query,
      event.locale,
      event.page,
    );
    result.fold(
      (failure) => emit(SearchMoviesFailure(message: failure.message)),
      (movies) => emit(SearchMoviesSuccess(movies: movies as List<MovieModel>)),
    );
  }
}
