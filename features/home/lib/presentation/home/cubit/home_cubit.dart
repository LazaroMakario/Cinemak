import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/models/movie.dart';
import 'package:home/domain/usecases/get_most_popular_movies.dart';
import 'package:home/domain/usecases/get_now_playing_movies.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMostPopularMoviesUseCase _getMostPopularMovies;
  final GetNowPlayingMoviesUseCase _getNowPlayingMovies;

  HomeCubit(
    this._getMostPopularMovies,
    this._getNowPlayingMovies,
  ) : super(const HomeState.initial());

  Future<void> getMovies() async {
    print('HomeCubit.getMovies() called');

    emit(const HomeState.loading());

    final popularMoviesResult = await _getMostPopularMovies();
    final nowPlayingResult = await _getNowPlayingMovies();

    popularMoviesResult.fold(
      (failure) => emit(HomeState.error(failure.toString())),
      (mostPopularMovies) {
        nowPlayingResult.fold(
          (failure) => emit(HomeState.error(failure.toString())),
          (nowPlayingMovies) => emit(
            HomeState.loaded(
              mostPopularMovies: mostPopularMovies,
              nowPlayingMovies: nowPlayingMovies,
            ),
          ),
        );
      },
    );
  }
}
