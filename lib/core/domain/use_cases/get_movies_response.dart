import 'package:dartz/dartz.dart';
import 'package:tmdb/core/data/repositories/movies_repository_impl.dart';

import '../../error/failures/failure.dart';
import '../entities/movies_response_entity.dart';
import '../repositories/movie_repository.dart';
import 'params/movies_params.dart';
import 'use_case.dart';

class GetMoviesResponse extends UseCase<MoviesResponseEntity, MoviesParams> {
  GetMoviesResponse(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, MoviesResponseEntity>> call(MoviesParams params) {
    print('bbbb ${params.path} ${params.query.toString()}');
    return movieRepository.getMoviesResponse(
      path: params.path,
      query: params.query,
    );
  }
}
