// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/info_list_tmdb.dart';
import '../providers/media_for_scroll_list.dart';

class MediaProvider with ChangeNotifier {
  MediaProvider() {
    _isInit = true;
    notifyListeners();
  }

  bool _isInit = false;
  bool get isInit => _isInit;

  MediaForScrollList trendingMovie =
      MediaForScrollList(TypeListMedia.trendingMovieWeek);

  void initTrendingMovie() {
    trendingMovie.init();
    // notifyListeners();
  }

  MediaForScrollList popularMovie =
      MediaForScrollList(TypeListMedia.moviePopular);

  void initPopularMovie() {
    popularMovie.init();
    notifyListeners();
  }
}
