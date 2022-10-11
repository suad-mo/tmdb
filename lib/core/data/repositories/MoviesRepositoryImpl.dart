import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/configuration/request/request_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb/core/domain/repositories/movie_repository.dart';
import 'package:tmdb/core/error/failures/failure.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> getListMovies(
      RequestMovies requestMovies) {
    // TODO: implement getListMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }
}
