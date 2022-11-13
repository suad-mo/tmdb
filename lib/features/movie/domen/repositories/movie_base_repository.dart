import 'package:dartz/dartz.dart';

import '../entities/movie_base_entity.dart';
import '../../../../core/error/failures/failure.dart';

abstract class MovieBaseRepository {
  Future<Either<Failure, MovieBaseEntity>> getMovieBase();

  //Future<Either<Failure, MovieBaseEntity>> getMovieCast(int id);

}
