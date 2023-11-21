part of 'get_movies_bloc.dart';

abstract class GetMoviesEvent extends Equatable {
  const GetMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMovies extends GetMoviesEvent {
  const FetchMovies({required this.page, required this.locale});
  final int page;
  final String locale;

  @override
  List<Object> get props => [
        page,
        locale,
      ];
}
