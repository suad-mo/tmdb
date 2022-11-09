import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../entities/params/person_params.dart';
import '../entities/person_detail_entyty.dart';
import '../repositories/person_detail_repository.dart';
import 'person_use_case.dart';

class GetPersonDetailUseCase
    implements PersonUseCase<PersonDetailEntity, PersonParams> {
  final PersonDetailRepository _personDetailRepository;

  GetPersonDetailUseCase(
      {required PersonDetailRepository personDetailRepository})
      : _personDetailRepository = personDetailRepository;

  @override
  Future<Either<Failure, PersonDetailEntity>> call(PersonParams params) async {
    final personDetail =
        await _personDetailRepository.getPersonDetail(params.id);
    return personDetail;
  }
}
