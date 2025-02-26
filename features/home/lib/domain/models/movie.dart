import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required bool adult,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required double popularity,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Movie;
}
