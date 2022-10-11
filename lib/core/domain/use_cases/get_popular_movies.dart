import 'package:tmdb/core/domain/repositories/movie_repository.dart';
import 'package:tmdb/core/domain/use_cases/params/popular_movies_params.dart';
import 'package:tmdb/core/error/failures/failure.dart';

import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';

import 'use_case.dart';

class GetPopularMovies extends UseCase<List<MovieEntity>, PopularMovieParams> {
  GetPopularMovies(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(PopularMovieParams params) {
    return movieRepository.getListMovie();
  }
}
