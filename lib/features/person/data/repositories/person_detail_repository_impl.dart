import 'package:dartz/dartz.dart';
import '../../../../core/error/failures/server_failure.dart';
import '../../../../core/error/failures/failure.dart';
import '../../domain/entities/person_detail_entyty.dart';
import '../../domain/repositories/person_detail_repository.dart';
import '../data_sources/remote_data_source.dart/person_detail_remote_data_source.dart';

class PersonDetailRepositoryImpl implements PersonDetailRepository {
  final PersonDetailRemoteDataSource personDetailRemoteDataSource;

  PersonDetailRepositoryImpl({required this.personDetailRemoteDataSource});
  @override
  Future<Either<Failure, PersonDetailEntity>> getPersonDetail(int id) async {
    try {
      final remotePersonDetail =
          await personDetailRemoteDataSource.getPersonDetailsById(id);
      return Right(remotePersonDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
