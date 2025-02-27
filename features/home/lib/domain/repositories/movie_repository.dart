import 'package:dartz/dartz.dart';
import 'package:home/domain/models/movie.dart';
import '../../commons/error/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getMostPopularMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
}
