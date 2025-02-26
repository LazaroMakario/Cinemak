import 'package:dio/dio.dart';
import 'package:home/core/error/failures.dart';
import 'package:home/core/network/api_client.dart';
import 'package:home/data/datasources/remote/movie_remote_data_source.dart';
import 'package:home/data/models/movies_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final MovieService _apiClient;

  MovieRemoteDataSourceImpl(this._apiClient);

  @override
  Future<MoviesResponse> getMostPopularMovies() async {
    try {
      final response = await _apiClient.getMostPopularMovies();

      if (response.response.statusCode == 200) {
        return response.data;
      } else {
        throw const Failure.server();
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<MoviesResponse> getNowPlayingMovies() async {
    try {
      final response = await _apiClient.getNowPlayingMovies();

      if (response.response.statusCode == 200) {
        return response.data;
      } else {
        throw const Failure.server();
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      default:
        return Failure.server(error.message);
    }
  }
}
