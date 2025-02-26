import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/models/movie.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const MovieModel._();

  const factory MovieModel({
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
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Movie toEntity() => Movie(
        id: id,
        title: title,
        overview: overview,
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
