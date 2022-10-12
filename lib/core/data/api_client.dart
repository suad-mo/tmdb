import 'dart:convert';

import 'package:http/http.dart';

import '../../configuration.dart';
import '../error/exceptions/server_exception.dart';

class ApiClient {
  final Client _client;

  const ApiClient(this._client);

  dynamic get({
    required String path,
    Map<String, String>? query,
  }) async {
    final headers = <String, String>{
      'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
      'Content-Type': 'application/json;charset=utf-8'
    };

    final url = Uri.https(
      TMDB.apiBaseUrl3,
      path,
      query,
    );

    final response = await _client.get(url, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw ServerException();
  }
}
