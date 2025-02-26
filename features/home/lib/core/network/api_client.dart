import 'package:dio/dio.dart';
import 'package:home/data/models/movies_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
@singleton
abstract class MovieService {
  @factoryMethod
  factory MovieService(Dio dio) = _MovieService;

  @GET(
      "discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")
  Future<HttpResponse<MoviesResponse>> getMostPopularMovies();

  @GET(
      "discover/movie?include_adult=false&include_video=false&language=es-MX&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte=2025-02-01&release_date.lte=2025-02-28")
  Future<HttpResponse<MoviesResponse>> getNowPlayingMovies();
}
