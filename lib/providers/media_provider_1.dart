// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

import '../models/info_list_tmdb.dart';
import '../providers/media_for_scroll_list.dart';

class MediaProvider1 {
  MediaProvider1();

  final MediaForScrollList trendingMovie =
      MediaForScrollList(TypeListMedia.trendingMovieWeek);

  final MediaForScrollList popularMovie =
      MediaForScrollList(TypeListMedia.moviePopular);
}
