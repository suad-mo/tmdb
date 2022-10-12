import 'package:dartz/dartz.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

import '../../error/failures/failure.dart';
import '../../error/failures/server_failure.dart';

import '../data_source/remote_data_source/movies_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl({required MovieRemoteDataSource movieRemoteDataSource})
      : _movieRemoteDataSource = movieRemoteDataSource;

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMovies({
    required String path,
    Map<String, String>? query,
  }) async {
    try {
      final List<MovieModel> movies =
          await _movieRemoteDataSource.getListMovies(
        path: path,
        query: query,
      );
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final List<MovieModel> movies = await _movieRemoteDataSource.getPopular();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
