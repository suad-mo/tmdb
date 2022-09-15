import 'package:flutter/material.dart';

import '../../widgets/swiper/swiper_header.dart';
import '../../helpers/tmbd_res_data.dart';
import '../../models/movie.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  static const routeName = '/movie';

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Movie? _movie;
  var _loadedInitData = false;

  List<String> get _backdrops {
    List<String> backdropsList = <String>[];
    final backdrops = _movie!.images!.backdrops;
    if (backdrops != null) {
      for (var i = 0;
          i < (backdrops.length > 10 ? 10 : backdrops.length);
          i++) {
        final path = backdrops[i].filePath;
        if (path != null) {
          backdropsList.add(path);
        }
      }
    }
    return backdropsList;
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final id = ModalRoute.of(context)?.settings.arguments as int;
      TmdbData.getMovie(id).then((movie) {
        setState(() {
          _movie = movie;
          _loadedInitData = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _movie == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(title: Text(_movie!.title!)),
            body: SwiperHeader(_backdrops),
          );
  }
}
