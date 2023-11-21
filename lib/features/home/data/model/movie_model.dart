// ignore_for_file: overridden_fields

import 'package:challenge/app/presentation/env/env.dart';
import 'package:challenge/features/home/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  @override
  @JsonKey(
    name: 'poster_path',
  )
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const MovieModel({
    required bool adult,
    required this.backdropPath,
    required this.genreIds,
    required int id,
    required this.originalLanguage,
    required this.originalTitle,
    required String overview,
    required double popularity,
    required this.posterPath,
    required this.releaseDate,
    required String title,
    required bool video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$MovieModelToJson(this);
    json['poster_path'] = '${Env.baseImage}${json['poster_path']}';
    json['backdrop_path'] = '${Env.baseImage}${json['backdrop_path']}';
    return json;
  }

  static List<MovieModel> fromResult(List<dynamic> result) {
    return result.map((json) => MovieModel.fromJson(json)).toList();
  }
}
