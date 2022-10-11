import 'package:dartz/dartz.dart';

import '../repositories/movie_repository.dart';
import '../../error/failures/failure.dart';

abstract class UseCase<Type, Params> {
  final MovieRepository movieRepository;

  const UseCase({required this.movieRepository});

  Future<Either<Failure, Type>> call(Params params);
}
