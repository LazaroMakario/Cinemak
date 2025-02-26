import 'package:dartz/dartz.dart';
import 'package:home/data/datasources/remote/movie_remote_data_source.dart';
import 'package:home/domain/models/movie.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final InternetConnectionChecker connectionChecker;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, List<Movie>>> getMostPopularMovies() async {
    if (await connectionChecker.hasConnection) {
      try {
        final response = await remoteDataSource.getMostPopularMovies();
        final movies =
            response.results.map((model) => model.toEntity()).toList();
        return Right(movies);
      } catch (e) {
        return const Left(Failure.server());
      }
    } else {
      return const Left(Failure.connection());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    if (await connectionChecker.hasConnection) {
      try {
        final response = await remoteDataSource.getNowPlayingMovies();
        final movies =
            response.results.map((model) => model.toEntity()).toList();
        return Right(movies);
      } catch (e) {
        return const Left(Failure.server());
      }
    } else {
      return const Left(Failure.connection());
    }
  }
}
