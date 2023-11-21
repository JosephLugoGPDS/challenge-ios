part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {
  const SearchMoviesInitial();
}

class SearchMoviesLoading extends SearchMoviesState {
  const SearchMoviesLoading();
}

class SearchMoviesSuccess extends SearchMoviesState {
  final List<MovieModel> movies;

  const SearchMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

class SearchMoviesFailure extends SearchMoviesState {
  final String message;

  const SearchMoviesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
