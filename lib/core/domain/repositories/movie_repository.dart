import 'package:dartz/dartz.dart';

import '../../error/failures/failure.dart';
import '../entities/movie_entity.dart';
import '../entities/movies_response_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getListMovies({
    required String path,
    Map<String, String>? query,
  });

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, MoviesResponseEntity>> getMoviesResponse({
    required String path,
    Map<String, String>? query,
  });
}
