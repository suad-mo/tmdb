import 'package:flutter/foundation.dart';
import 'package:tmdb/helpers/tmbd_res_data.dart';
import 'package:tmdb/models/movie.dart';

import '../models/info_list_tmdb.dart';
import '../providers/media_for_scroll_list.dart';

class MovieProvider with ChangeNotifier {
  MovieProvider();

  Movie? _movie;
  Movie? get movie => _movie;

  void setMovie(int id) async {
    final x = await TmdbData.getMovie(id);
    _movie = x;
    notifyListeners();
  }
}
