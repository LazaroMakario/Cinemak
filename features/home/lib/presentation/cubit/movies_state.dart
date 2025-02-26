part of 'movies_cubit.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = _Initial;
  const factory MoviesState.loading() = _Loading;
  const factory MoviesState.loaded({
    required List<Movie> upcomingMovies,
    required List<Movie> topRatedMovies,
  }) = _Loaded;
  const factory MoviesState.error(String message) = _Error;
}
