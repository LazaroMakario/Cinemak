import 'package:freezed_annotation/freezed_annotation.dart';
import 'movie_model.dart';

part 'movies_response.freezed.dart';
part 'movies_response.g.dart';

@freezed
class MoviesResponse with _$MoviesResponse {
  const factory MoviesResponse({
    Dates? dates,
    required int page,
    required List<MovieModel> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}

@freezed
class Dates with _$Dates {
  const factory Dates({
    required String maximum,
    required String minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}
