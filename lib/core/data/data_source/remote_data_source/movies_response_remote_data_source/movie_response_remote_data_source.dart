import '../../../models/movies_response_model.dart';

abstract class MoviesResponseRemoteDataSource {
  Future<MoviesResponseModel> getMoviesResponse({
    required String path,
    Map<String, String>? query,
  });
}
