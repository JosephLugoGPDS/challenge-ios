part of 'get_movies_bloc.dart';

abstract class GetMoviesState extends Equatable {
  const GetMoviesState();

  @override
  List<Object> get props => [];
}

class GetMoviesInitial extends GetMoviesState {
  const GetMoviesInitial();
}

class GetMoviesLoading extends GetMoviesState {
  const GetMoviesLoading();
}

class GetMoviesSuccess extends GetMoviesState {
  final List<MovieModel> movies;

  const GetMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

class GetMoviesFailure extends GetMoviesState {
  final String message;

  const GetMoviesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
