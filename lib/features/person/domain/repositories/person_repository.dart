import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';
import '../entities/person_detail_entyty.dart';
// import 'package:tmdb/core/zz.dart';

abstract class PersonDetailRepository {
  Future<Either<Failure, PersonDetailEntity>> getPersonDetail(int id);
}
