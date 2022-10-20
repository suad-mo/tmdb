import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import '../data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source.dart';
import '../../domain/entities/movies_response_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

import '../../error/failures/failure.dart';
import '../../error/failures/server_failure.dart';

import '../models/movie_model.dart';
import '../models/movies_response_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl(
      {required MovieRemoteDataSourceImpl movieRemoteDataSource})
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

  @override
  Future<Either<Failure, MoviesResponseEntity>> getMoviesResponse({
    required String path,
    Map<String, String>? query,
  }) async {
    try {
      print('ppppp $path');
      final MoviesResponseModel res =
          await _movieRemoteDataSource.getMoviesResponse(
        path: path,
        query: query,
      );
      print('kkkkk');
      return Right(res as MoviesResponseEntity);
    } catch (e) {
      print('greska...${e.toString()}');
      return Left(ServerFailure());
    }
  }
}
