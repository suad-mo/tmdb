import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../configuration.dart';
import './info_list_tmdb.dart';
import './item_media.dart';

class ReqListTmbd {
  ReqListTmbd({
    required this.typeListMedia,
    required this.page,
  });
  final TypeListMedia typeListMedia;
  final int page;
  late InfoListTmdb info = InfoListTmdb.setByType(typeListMedia);
}

class ResponseData {
  ResponseData({
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

class ResListTmdb {
  ResListTmdb(this.reqListTmbd);
  final ReqListTmbd reqListTmbd;

  Future<ResponseData> fetchDatafromTmdb() async {
    final partUrl = reqListTmbd.info.partUrl;
    final page = reqListTmbd.page;
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

  ResponseData _getListfromJson(Map<String, dynamic> data, int page) {
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
      final ResponseData resList = ResponseData(
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
}
