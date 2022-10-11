import 'package:dartz/dartz.dart';

import '../../error/failures/failure.dart';
import '../repositories/movie_repository.dart';
import '../entities/movie_entity.dart';
import 'params/no_params.dart';
import 'use_case.dart';

class GetPopularMovies extends UseCase<List<MovieEntity>, NoParams> {
  GetPopularMovies(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) {
    return movieRepository.getPopularMovies();
  }
}
