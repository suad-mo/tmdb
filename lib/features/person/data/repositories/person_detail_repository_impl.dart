import 'package:dartz/dartz.dart';
import 'package:tmdb/features/tv/domen/entities/tv_cast_entity.dart';
import '../../../../core/error/failures/server_failure.dart';
import '../../../../core/error/failures/failure.dart';
import '../../../movie/domen/entities/movie_cast_entity.dart';
import '../../domain/entities/person_movie_credits_entity.dart';
import '../../domain/entities/person_detail_entyty.dart';
import '../../domain/repositories/person_detail_repository.dart';
import '../data_sources/remote_data_source.dart/person_detail_remote_data_source.dart';

class PersonDetailRepositoryImpl implements PersonDetailRepository {
  final PersonDetailRemoteDataSource personDetailRemoteDataSource;

  PersonDetailRepositoryImpl({required this.personDetailRemoteDataSource});
  @override
  Future<Either<Failure, PersonDetailEntity>> getPersonDetail(int id) async {
    try {
      final remotePersonDetail =
          await personDetailRemoteDataSource.getPersonDetailsById(id);
      return Right(remotePersonDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PersonMovieCreditsEntity>> getPersonMovieCreditsEntity(
      int id) async {
    try {
      final remoteCredits = await personDetailRemoteDataSource
          .getPersonMovieCreditsEntityById(id);
      return Right(remoteCredits);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieCastEntity>>> getListMovieCastEntity(
      int id) async {
    try {
      final listMovieCast =
          await personDetailRemoteDataSource.getListMovieCastEntityById(id);
      return Right(listMovieCast);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvCastEntity>>> getListTvCastEntity(
      int id) async {
    try {
      final listTvCast =
          await personDetailRemoteDataSource.getListTvCastEntityById(id);
      return Right(listTvCast);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
