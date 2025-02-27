import 'package:dio/dio.dart';
import 'package:home/data/models/movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(
      "discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")
  Future<HttpResponse<MoviesResponse>> getMostPopularMovies();

  @GET(
      "discover/movie?include_adult=false&include_video=false&language=es-MX&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte=2025-02-01&release_date.lte=2025-02-28")
  Future<HttpResponse<MoviesResponse>> getNowPlayingMovies();
}
