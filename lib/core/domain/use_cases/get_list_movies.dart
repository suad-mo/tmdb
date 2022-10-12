import 'package:dartz/dartz.dart';

import '../../error/failures/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'params/movies_params.dart';
import 'use_case.dart';

class GetListMovies extends UseCase<List<MovieEntity>, MoviesParams> {
  GetListMovies(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(MoviesParams params) {
    return movieRepository.getListMovies(
      path: params.path,
      query: params.query,
    );
  }
}
