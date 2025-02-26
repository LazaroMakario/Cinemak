import 'package:dartz/dartz.dart';
import 'package:home/domain/models/movie.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/movie_repository.dart';

@injectable
class GetMostPopularMoviesUseCase {
  final MovieRepository repository;

  GetMostPopularMoviesUseCase(this.repository);

  Future<Either<Failure, List<Movie>>> call() {
    return repository.getMostPopularMovies();
  }
}
