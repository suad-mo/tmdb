import 'package:tmdb/core/data/api_client.dart';

import '../../models/movie_model.dart';
import '../../../configuration/request/request_movies.dart';
import '../../models/movies_response_model.dart';
import 'movies_remote_data_source.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _apiClient;

  MovieRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<MovieModel>> getListMovies(RequestMovies requestMovies) async {
    final decodedResponse = await _apiClient.get(requestMovies);
    return _parseDecodedResponse(decodedResponse);
  }

  List<MovieModel> _parseDecodedResponse(dynamic decodedResponse) {
    return MoviesResponseModel.fromJson(decodedResponse).movies;
  }

  @override
  Future<List<MovieModel>> getPopular() {
    // TODO: implement getPopular
    throw UnimplementedError();
  }
}
