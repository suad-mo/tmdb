import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures/failure.dart';
import 'package:tmdb/features/tv/domen/entities/tv_cast_entity.dart';

abstract class TvRepository {
  // Future<Either<Failure, TvCastEntity>> getTvCreditsEntity(int id);
  Future<Either<Failure, List<TvCastEntity>>> getListTvCastEntity(int id);
}
