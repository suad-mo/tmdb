import '../../../../../core/data/api_client.dart';
import '../../../../../core/error/exceptions/decode_exseption.dart';
import '../../../../movie/domen/entities/movie_cast_entity.dart';
import '../../../../tv/domen/entities/tv_cast_entity.dart';
import '../../../domain/entities/person_movie_credits_entity.dart';
import '../../models/person_detail_model.dart';
import '../../models/person_movie_credits_model.dart';
import '../../models/person_tv_credits_model.dart';

abstract class PersonDetailRemoteDataSource {
  /// Calls the https://api.themoviedb.org/3/person/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonDetailModel> getPersonDetailsById(int id);

  /// Calls the https://api.themoviedb.org/3/person/{id}/movie_credits endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonMovieCreditsEntity> getPersonMovieCreditsEntityById(int id);

  /// Calls the https://api.themoviedb.org/3/person/{id}/movie_credits endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieCastEntity>> getListMovieCastEntityById(int id);

  /// Calls the https://api.themoviedb.org/3/person/{id}/tv_credits endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TvCastEntity>> getListTvCastEntityById(int id);
}

class PersonDetailRemoteDataSourceImpl implements PersonDetailRemoteDataSource {
  final ApiClient _apiClient;

  PersonDetailRemoteDataSourceImpl(this._apiClient);

  @override
  Future<PersonDetailModel> getPersonDetailsById(int id) async {
    final path = '/3/person/$id';
    final query = <String, String>{
      'append_to_response': 'images',
    };
    try {
      final decodedResponse = await _apiClient.get(path: path, query: query);
      return PersonDetailModel.fromJson(decodedResponse);
    } catch (e) {
      throw DecodeExeption();
    }
  }

  @override
  Future<PersonMovieCreditsEntity> getPersonMovieCreditsEntityById(
      int id) async {
    final path = '/3/person/$id/movie_credits';
    try {
      final decodeResponse = await _apiClient.get(path: path);
      return PersonMovieCreditsModel.fromJsonOnly(decodeResponse);
    } catch (e) {
      throw DecodeExeption();
    }
  }

  @override
  Future<List<MovieCastEntity>> getListMovieCastEntityById(int id) async {
    final path = '/3/person/$id/movie_credits';
    try {
      final decodeResponse = await _apiClient.get(path: path);
      return PersonMovieCreditsModel.fromJsonOnly(decodeResponse).cast!;
    } catch (e) {
      throw DecodeExeption();
    }
  }

  @override
  Future<List<TvCastEntity>> getListTvCastEntityById(int id) async {
    final path = '/3/person/$id/tv_credits';
    try {
      final decodeResponse = await _apiClient.get(path: path);
      return PersonTvCreditsModel.fromJsonOnly(decodeResponse).cast!;
    } catch (e) {
      throw DecodeExeption();
    }
  }
}
