import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../configuration.dart';
import '../models/info_list_tmdb.dart';
import '../models/item_media.dart';
import '../models/movie.dart' as movie;

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
      return http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      }).then((res) {
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

  static Future<movie.Movie> getMovie(int idMovie) async {
    final url = Uri.https(
      TMDB.apiBaseUrl3,
      '/3/movie/${idMovie.toString()}',
    );
    try {
      return http.get(url, headers: {
        'Authorization': 'Bearer ${TMDB.apiReadAccessToken}',
        'Content-Type': 'application/json;charset=utf-8'
      }).then((res) {
        if (res.body.isEmpty) Exception('Greska...res.body.isEmpty = true');
        final extractedData = jsonDecode(res.body);
        return movie.Movie.fromJson(extractedData);
      });
    } catch (e) {
      rethrow;
    }
  }
}
