import 'package:tmdb/core/data/api_client.dart';

import '../../models/movie_model.dart';
import '../../models/movies_response_model.dart';
import 'movies_remote_data_source.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _apiClient;

  MovieRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<MovieModel>> getListMovies({
    required String path,
    Map<String, String>? query,
  }) async {
    final decodedResponse = await _apiClient.get(
      path: path,
      query: query,
    );
    return _parseDecodedResponse(decodedResponse);
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final decodedResponse = await _apiClient
        .get(path: '/trending/movies/day', query: {'page': '1'});
    return _parseDecodedResponse(decodedResponse);
  }

  List<MovieModel> _parseDecodedResponse(dynamic decodedResponse) {
    return MoviesResponseModel.fromJson(decodedResponse).movies;
  }

  @override
  Future<MoviesResponseModel> getMoviesResponse({
    required String path,
    Map<String, String>? query,
  }) async {
    final decodedResponse = await _apiClient.get(
      path: path,
      query: query,
    );

    return MoviesResponseModel.fromJson(decodedResponse);
  }
}
