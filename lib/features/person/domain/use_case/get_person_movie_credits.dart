import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../entities/params/person_params.dart';
import '../entities/person_movie_credits_entity.dart';
import 'person_use_case.dart';

import '../repositories/person_detail_repository.dart';

class GetPersonMovieCreditsUseCase
    implements PersonUseCase<PersonMovieCreditsEntity, PersonParams> {
  final PersonDetailRepository _personDetailRepository;

  GetPersonMovieCreditsUseCase({
    required PersonDetailRepository personDetailRepository,
  }) : _personDetailRepository = personDetailRepository;

  @override
  Future<Either<Failure, PersonMovieCreditsEntity>> call(
      PersonParams params) async {
    final credits =
        await _personDetailRepository.getPersonMovieCreditsEntity(params.id);
    return credits;
  }

  // @override
  // Future<Either<Failure, MovieCastEntity>> call(PersonParams params) async {
  //   final personCastMovies =
  //       await _personDetailRepository.getPersonCastMovies(params.id);
  //   return personCastMovies;
  // }
}
