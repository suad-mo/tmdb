import 'package:dartz/dartz.dart';
import 'package:tmdb/core/domain/use_cases/params/list_movies_params.dart';
import 'package:tmdb/core/domain/use_cases/params/movies_params.dart';

import '../../error/failures/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'use_case.dart';

class GetListMovies extends UseCase<List<MovieEntity>, ListMoviesParams> {
  GetListMovies(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(ListMoviesParams params) {
    return movieRepository.getListMovies(params.requestMovies);
  }
}
