import 'dart:async';
import 'package:flutter/foundation.dart';

import '../models/info_list_tmdb.dart';
import '../models/req_list_tmbd.dart';
import '../models/item_media.dart';

class ResultMediaScrolList {
  ResultMediaScrolList({
    required this.typeListMedia,
    required this.items,
    required this.currentPage,
    required this.totalResults,
    required this.nextPage,
    required this.totalPages,
  });
  final TypeListMedia typeListMedia;
  final int currentPage;
  final int nextPage;
  final List<ItemMedia> items;
  final int totalPages;
  final int totalResults;
}

class MediaForScrollList with ChangeNotifier {
  MediaForScrollList(this.typeListMedia);

  final TypeListMedia typeListMedia;

  ResultMediaScrolList _resultMediaScrolList = ResultMediaScrolList(
    typeListMedia: TypeListMedia.movieNowPlaying,
    items: [],
    currentPage: 0,
    nextPage: 1,
    totalPages: 0,
    totalResults: 0,
  );

  ResultMediaScrolList get resultMediaScrolList => _resultMediaScrolList;

  int _currentPage = 0;
  int _nextPage = 1;
  int _totalPages = 0;
  int _totalResults = 0;
  final List<ItemMedia> _items = [];
  bool _isInit = false;
  bool _refresh = false;

  List<ItemMedia> get items => [..._items];

  int get nextPage => _nextPage;
  int get currentPage => _currentPage;
  bool get isInit => _isInit;
  bool get refresh => _refresh;

  ResListTmdb get resListTmdb {
    final reqListTmbd =
        ReqListTmbd(typeListMedia: typeListMedia, page: _nextPage);
    return ResListTmdb(reqListTmbd);
  }

  Future<ResultMediaScrolList> get mediaScroll {
    return resListTmdb.fetchDatafromTmdb().then((resData) {
      _totalPages = resData.totalPages;
      _totalResults = resData.totalResults;
      _currentPage = resData.page;
      _nextPage = resData.page + 1;
      _items.addAll(resData.items);
      _isInit = true;
      _resultMediaScrolList = ResultMediaScrolList(
        typeListMedia: typeListMedia,
        items: _items,
        currentPage: _currentPage,
        nextPage: _nextPage,
        totalPages: _totalPages,
        totalResults: _totalResults,
      );
      notifyListeners();
      return _resultMediaScrolList;
    });
  }

  Future<void> nextMediaScroll([bool refresh = false]) async {
    if (!_refresh) {
      return;
    }
    return resListTmdb.fetchDatafromTmdb().then((resData) {
      _totalPages = resData.totalPages;
      _totalResults = resData.totalResults;
      _currentPage = resData.page;
      _nextPage = resData.page + 1;
      _items.addAll(resData.items);
      _isInit = true;
      _refresh = refresh;
      _resultMediaScrolList = ResultMediaScrolList(
        typeListMedia: typeListMedia,
        items: _items,
        currentPage: _currentPage,
        nextPage: _nextPage,
        totalPages: _totalPages,
        totalResults: _totalResults,
      );
      notifyListeners();
      return;
    });
  }

  Future<void> mediaScrollByPage(int page) {
    return resListTmdb.fetchDatafromTmdbByPage(page).then((resData) {
      _totalPages = resData.totalPages;
      _totalResults = resData.totalResults;
      _currentPage = resData.page;
      _nextPage = resData.page + 1;
      _items.addAll(resData.items);
      _isInit = true;
      notifyListeners();
      return;
    });
  }

  void init() async {
    if (!_isInit) return;
    final resData = await resListTmdb.fetchDatafromTmdb();
    _totalPages = resData.totalPages;
    _totalResults = resData.totalResults;
    _currentPage = resData.page;
    _nextPage = resData.page + 1;
    _items.addAll(resData.items);
    _isInit = true;
    notifyListeners();
  }

  void next() async {
    if (_isInit) return;
    final resData = await resListTmdb.fetchDatafromTmdb();
    _currentPage = resData.page;
    _nextPage = resData.page + 1;
    _items.addAll(resData.items);
    notifyListeners();
  }
}
