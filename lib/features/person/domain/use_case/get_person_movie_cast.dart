import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../../../movie/domen/entities/movie_cast_entity.dart';
import '../entities/params/person_params.dart';
import '../repositories/person_detail_repository.dart';
import 'person_use_case.dart';

class GetPersonMovieCastsUseCase
    implements PersonUseCase<List<MovieCastEntity>, PersonParams> {
  final PersonDetailRepository _personDetailRepository;

  GetPersonMovieCastsUseCase(
    PersonDetailRepository personDetailRepository,
  ) : _personDetailRepository = personDetailRepository;

  @override
  Future<Either<Failure, List<MovieCastEntity>>> call(
      PersonParams params) async {
    final listMovieCast =
        await _personDetailRepository.getListMovieCastEntity(params.id);
    return listMovieCast;
  }
}
