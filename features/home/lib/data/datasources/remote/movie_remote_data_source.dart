import 'package:home/data/models/movies_response.dart';

abstract class MovieRemoteDataSource {
  Future<MoviesResponse> getMostPopularMovies();
  Future<MoviesResponse> getNowPlayingMovies();
}
