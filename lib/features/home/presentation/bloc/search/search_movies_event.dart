part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchMovies extends SearchMoviesEvent {
  const FetchSearchMovies(
      {required this.page, required this.locale, required this.query});
  final int page;
  final String locale;
  final String query;

  @override
  List<Object> get props => [
        page,
        locale,
        query,
      ];
}
