import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failure.dart';

abstract class PersonUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
