import 'dart:convert';

import 'package:http/http.dart';
import 'package:tmdb/core/configuration/request/request_movies.dart';
import 'package:tmdb/core/error/exceptions/server_exception.dart';

import '../../configuration.dart';

class ApiClient {
  final Client _client;

  const ApiClient(this._client);

  dynamic get(RequestMovies requestMovies) async {
    final headers = <String, String>{
      'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
      'Content-Type': 'application/json;charset=utf-8'
    };

    final url = Uri.https(
      TMDB.apiBaseUrl3,
      requestMovies.path,
      requestMovies.query,
    );

    final response = await _client.get(url, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw ServerException();
  }
}
