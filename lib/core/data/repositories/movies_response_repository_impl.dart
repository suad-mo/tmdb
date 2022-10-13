// import 'package:tmdb/core/data/models/movies_response_model.dart';
// import 'package:tmdb/core/domain/entities/movies_response_entity.dart';
// import 'package:dartz/dartz.dart';
// import 'package:tmdb/core/domain/repositories/movies_response_repository.dart';
// import 'package:tmdb/core/error/failures/failure.dart';

// import '../../error/failures/server_failure.dart';
// import '../data_source/remote_data_source/movies_remote_data_source.dart';

// class MoviesResponseRepositoryImpl extends MoviesResponseRepository {
//   final MovieRemoteDataSource _movieRemoteDataSource;

//   MoviesResponseRepositoryImpl({required MovieRemoteDataSource movieRemoteDataSource})
//       : _movieRemoteDataSource = movieRemoteDataSource;
  
//   @override
//   Future<Either<Failure, MoviesResponseEntity>> getMoviesResponse({
//     required String path,
//     Map<String, String>? query,
//   }) async {
//      try {
//       final MoviesResponseModel res =
//           await _movieRemoteDataSource.getMoviesResponse(
//         path: path,
//         query: query,
//       );
//       return Right(res);
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }
// }
