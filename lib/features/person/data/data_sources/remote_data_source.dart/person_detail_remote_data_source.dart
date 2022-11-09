import 'package:tmdb/core/data/api_client.dart';
import 'package:tmdb/core/error/exceptions/decode_exseption.dart';
import 'package:tmdb/features/person/data/models/person_detail_model.dart';

abstract class PersonDetailRemoteDataSource {
  /// Calls the https://api.themoviedb.org/3/person/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonDetailModel> getPersonDetailsById(int id);
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
}
