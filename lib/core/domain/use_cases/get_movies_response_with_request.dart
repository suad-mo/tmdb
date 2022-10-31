import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../enums/type_list_movies.dart';
import '../../error/failures/failure.dart';
import '../entities/movies_response_entity.dart';
import '../repositories/movie_repository.dart';

import 'use_case.dart';

class GetMoviesResponseWithRequest
    extends UseCase<MoviesResponseEntity, MoviesRequestParams> {
  GetMoviesResponseWithRequest(MovieRepository movieRepository)
      : super(movieRepository: movieRepository);

  @override
  Future<Either<Failure, MoviesResponseEntity>> call(
      MoviesRequestParams params) {
    return movieRepository.getMoviesResponse(
      path: params.listMoviesType.path,
      query: params.query,
    );
  }
}

class MoviesRequestParams extends Equatable {
  final ListMoviesType listMoviesType;
  final Map<String, String>? query;

  const MoviesRequestParams({
    required this.listMoviesType,
    required this.query,
  });

  @override
  List<Object?> get props => [
        listMoviesType,
        query,
      ];
}
