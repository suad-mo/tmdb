import 'package:flutter/foundation.dart';

import '../models/info_list_tmdb.dart';
import '../models/req_list_tmbd.dart';
import '../models/item_media.dart';

class MediaForScrollList with ChangeNotifier {
  MediaForScrollList(this.typeListMedia);

  final TypeListMedia typeListMedia;

  int _currentPage = 0;
  int _nextPage = 1;
  int _totalPages = 0;
  int _totalResults = 0;
  List<ItemMedia> _items = [];
  bool _isInit = false;

  List<ItemMedia> get items => [..._items];

  int get nextPage => _nextPage;
  int get currentPage => _currentPage;
  bool get isInit => _isInit;

  ResListTmdb get resListTmdb {
    final reqListTmbd =
        ReqListTmbd(typeListMedia: typeListMedia, page: _nextPage);
    return ResListTmdb(reqListTmbd);
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
