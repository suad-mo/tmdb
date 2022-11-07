import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures/failure.dart';
import '../entities/person_detail_entyty.dart';
import '../repositories/person_repository.dart';
import 'person_use_case.dart';

class GetPersonDetail implements PersonUseCase<PersonDetailEntity, Params> {
  final PersonDetailRepository _personDetailRepository;

  GetPersonDetail({required PersonDetailRepository personDetailRepository})
      : _personDetailRepository = personDetailRepository;

  @override
  Future<Either<Failure, PersonDetailEntity>> call(Params params) async {
    final personDetail =
        await _personDetailRepository.getPersonDetail(params.id);
    return personDetail;
  }
}

class Params extends Equatable {
  final int _id;

  const Params({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object?> get props => [_id];
}
