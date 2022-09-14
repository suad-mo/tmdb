// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:tmdb/configuration.dart';
import 'package:tmdb/widgets/Swiper/swiper_header.dart';

import '../../helpers/tmbd_res_data.dart';
import '../../models/movie.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  static const routeName = '/movie';
  // final int id;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Movie? _movie;

  //Može i bez ove provjere jer koristi -lete- ključnu riječ ispred promjenjivih
  // ignore: prefer_final_fields
  var _loadedInitData = false;
  // var _backdrops = <String>[];

  List<String> get _backdrops {
    List<String> backdropsList = <String>[];
    final backdrops = _movie!.images!.backdrops;
    if (backdrops != null) {
      for (var img in backdrops) {
        final path = img.filePath;
        if (path != null) {
          backdropsList.add(path);
        }
      }
    }
    return backdropsList;
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final id = ModalRoute.of(context)?.settings.arguments as int;
      TmdbData.getMovie(id).then((movie) {
        setState(() {
          _movie = movie;
          _loadedInitData = true;
          // _backdrops = movie!.images!.backdrops.forEach((element) { }) ?? [];
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
            // ignore: sized_box_for_whitespace
            body: SwiperHeader(_backdrops),
            // Container(
            //   width: double.infinity,
            //   height: 250,
            //   child: SwiperHeader(_backdrops),
            // ),
          );
  }
}
