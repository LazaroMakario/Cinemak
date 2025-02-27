import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/models/movie.dart';
import 'package:home/domain/usecases/get_most_popular_movies.dart';
import 'package:home/domain/usecases/get_now_playing_movies.dart';
import 'package:injectable/injectable.dart';

part 'movies_state.dart';
part 'movies_cubit.freezed.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  final GetMostPopularMoviesUseCase _getMostPopularMovies;
  final GetNowPlayingMoviesUseCase _getNowPlayingMovies;

  MoviesCubit(
    this._getMostPopularMovies,
    this._getNowPlayingMovies,
  ) : super(const MoviesState.initial());

  Future<void> getMovies() async {
    print('MoviesCubit.getMovies() called');

    emit(const MoviesState.loading());

    final popularMoviesResult = await _getMostPopularMovies();
    final nowPlayingResult = await _getNowPlayingMovies();

    popularMoviesResult.fold(
      (failure) => emit(MoviesState.error(failure.toString())),
      (mostPopularMovies) {
        nowPlayingResult.fold(
          (failure) => emit(MoviesState.error(failure.toString())),
          (nowPlayingMovies) => emit(
            MoviesState.loaded(
              mostPopularMovies: mostPopularMovies,
              nowPlayingMovies: nowPlayingMovies,
            ),
          ),
        );
      },
    );
  }
}
