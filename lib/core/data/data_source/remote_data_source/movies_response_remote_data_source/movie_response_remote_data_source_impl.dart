import '../../../api_client.dart';
import 'movie_response_remote_data_source.dart';

import '../../../models/movies_response_model.dart';

class MoviesResponseRemoteDataSourceImpl
    extends MoviesResponseRemoteDataSource {
  final ApiClient _apiClient;

  MoviesResponseRemoteDataSourceImpl(this._apiClient);

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
