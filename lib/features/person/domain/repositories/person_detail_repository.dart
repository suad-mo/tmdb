import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../../../movie/domen/entities/movie_cast_entity.dart';
import '../../../tv/domen/entities/tv_cast_entity.dart';
import '../entities/person_movie_credits_entity.dart';
import '../entities/person_detail_entyty.dart';

abstract class PersonDetailRepository {
  Future<Either<Failure, PersonDetailEntity>> getPersonDetail(int id);

  Future<Either<Failure, PersonMovieCreditsEntity>> getPersonMovieCreditsEntity(
      int id);

  Future<Either<Failure, List<MovieCastEntity>>> getListMovieCastEntity(int id);

  Future<Either<Failure, List<TvCastEntity>>> getListTvCastEntity(int id);
}
