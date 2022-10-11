import 'package:tmdb/core/configuration/request/request_movies.dart';
import 'package:tmdb/core/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getListMovies(RequestMovies requestMovies);
}
