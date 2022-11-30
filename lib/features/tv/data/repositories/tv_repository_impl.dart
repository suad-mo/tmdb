import 'package:tmdb/features/tv/domen/entities/tv_cast_entity.dart';
import 'package:tmdb/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb/features/tv/domen/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  @override
  Future<Either<Failure, List<TvCastEntity>>> getListTvCastEntity(int id) {
    // TODO: implement getListTvCastEntity
    throw UnimplementedError();
  }
}
