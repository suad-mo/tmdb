import 'package:dartz/dartz.dart';
import 'package:tmdb/core/configuration/request/request_movies.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/error/failures/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getListMovies(
      RequestMovies requestMovies);

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
