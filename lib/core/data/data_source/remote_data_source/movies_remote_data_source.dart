import 'package:tmdb/core/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getListMovies({
    required String path,
    Map<String, String>? query,
  });
}
