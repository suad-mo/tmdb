import '../../../models/movie_model.dart';
import '../../../models/movies_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getListMovies({
    required String path,
    Map<String, String>? query,
  });

  Future<MoviesResponseModel> getMoviesResponse({
    required String path,
    Map<String, String>? query,
  });
}
