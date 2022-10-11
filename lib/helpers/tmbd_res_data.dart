import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/models/credits/cast.dart';
import 'package:tmdb/models/credits/credits.dart';

import '../configuration.dart';
import '../models/info_list_tmdb.dart';
import '../models/item_media.dart';
import '../models/tv.dart';
import '../models/movie.dart';

const headers = <String, String>{
  'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
  'Content-Type': 'application/json;charset=utf-8'
};

class TypeMedia {
  static const String movie = 'movie';
  static const String tv = 'tv';
  static const String person = 'person';
}

class RequestForTmbdList {
  RequestForTmbdList({
    required this.typeListMedia,
    required this.page,
  });
  final TypeListMedia typeListMedia;
  final int page;
  late InfoListTmdb info = InfoListTmdb.setByType(typeListMedia);
}

class TmdbListResponse {
  TmdbListResponse({
    required this.page,
    required this.items,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<ItemMedia> items;
  final int totalPages;
  final int totalResults;
}

class TmdbData {
  static Future<TmdbListResponse> getList(
      TypeListMedia typeListMedia, int page) async {
    final RequestForTmbdList requestForTmbdList =
        RequestForTmbdList(typeListMedia: typeListMedia, page: page);
    final partUrl = requestForTmbdList.info.partUrl;
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/$partUrl',
      {'page': page.toString()},
    );
    try {
      return http.get(url, headers: headers).then((res) {
        if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
        final extractedData = jsonDecode(res.body);
        return _getListfromJson(extractedData, page);
      });
    } catch (e) {
      rethrow;
    }
  }

  static TmdbListResponse _getListfromJson(
      Map<String, dynamic> data, int page) {
    try {
      final items = <ItemMedia>[];
      if (data['results'] != null) {
        data['results'].forEach((v) {
          final itemMedia = ItemMedia.fromJson(v);
          if (itemMedia.isOK) {
            items.add(ItemMedia.fromJson(v));
          }
        });
      }
      final totalPages = data['total_pages'];
      final totalResults = data['total_results'];
      final TmdbListResponse resList = TmdbListResponse(
        page: page,
        items: items,
        totalPages: totalPages,
        totalResults: totalResults,
      );
      return resList;
    } catch (e) {
      if (kDebugMode) {
        print('Class ListMedia.fromJson...');
        print(e.toString());
      }
      rethrow;
    }
  }

  static Future<Movie> getMovie(int id) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/movie/${id.toString()}',
      {
        'append_to_response': 'images,videos'
      }, //?append_to_response=videos,images',
    );
    try {
      return http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      }).then((res) {
        if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
        final extractedData = jsonDecode(res.body);
        return Movie.fromJson(extractedData);
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<Movie> getMovieA(int id) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/movie/${id.toString()}?append_to_response=videos,images',
    );
    try {
      final res = await http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      });

      if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
      final extractedData = jsonDecode(res.body);
      return Movie.fromJson(extractedData);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Credits> getMovieCredits(int id, TypeMedia typeMedia) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/$typeMedia/${id.toString()}/credits',
    );
    try {
      final res = await http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      });

      if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
      final extractedData = jsonDecode(res.body);
      return Credits.fromJson(extractedData);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Cast>> getMovieCast(int id, String typeMedia) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/$typeMedia/${id.toString()}/credits',
    );
    try {
      final res = await http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      });

      if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
      final extractedData = jsonDecode(res.body);
      final credits = Credits.fromJson(extractedData);
      return credits.cast ?? <Cast>[];
    } catch (e) {
      rethrow;
    }
  }

  static Future<Tv> getTv(int id) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/tv/${id.toString()}?append_to_response=videos,images',
    );
    try {
      return http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      }).then((res) {
        if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
        final extractedData = jsonDecode(res.body);
        return Tv.fromJson(extractedData);
      });
    } catch (e) {
      rethrow;
    }
  }
}
