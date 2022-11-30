import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../../../tv/domen/entities/tv_cast_entity.dart';
import '../entities/params/person_params.dart';
import '../repositories/person_detail_repository.dart';
import 'person_use_case.dart';

class GetPersonTvCastsUseCase
    implements PersonUseCase<List<TvCastEntity>, PersonParams> {
  final PersonDetailRepository _personDetailRepository;

  GetPersonTvCastsUseCase(
    PersonDetailRepository personDetailRepository,
  ) : _personDetailRepository = personDetailRepository;

  @override
  Future<Either<Failure, List<TvCastEntity>>> call(PersonParams params) async {
    final listTvCast =
        await _personDetailRepository.getListTvCastEntity(params.id);
    return listTvCast;
  }
}
