import 'package:dartz/dartz.dart';
import 'package:home/domain/models/movie.dart';
import 'package:injectable/injectable.dart';
import '../../commons/error/failures.dart';
import '../repositories/movie_repository.dart';

@injectable
class GetNowPlayingMoviesUseCase {
  final MovieRepository repository;

  GetNowPlayingMoviesUseCase(this.repository);

  Future<Either<Failure, List<Movie>>> call() {
    return repository.getNowPlayingMovies();
  }
}
