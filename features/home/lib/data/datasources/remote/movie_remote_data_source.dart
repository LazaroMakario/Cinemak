import 'package:home/data/datasources/remote/response/movies_response.dart';

abstract class MovieRemoteDataSource {
  Future<MoviesResponse> getMostPopularMovies();
  Future<MoviesResponse> getNowPlayingMovies();
}
