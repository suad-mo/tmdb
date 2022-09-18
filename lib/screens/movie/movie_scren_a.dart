import 'package:flutter/material.dart';
import 'package:tmdb/helpers/tmbd_res_data.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/widgets/movie/movie_header.dart';
import 'package:tmdb/widgets/swiper/swiper_header.dart';

class MovieScreenA extends StatelessWidget {
  const MovieScreenA(this.id, {super.key});
  final int id;

  Future<Movie> _future() {
    return TmdbData.getMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: _future(),
      builder: (context, movie) {
        if (movie.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        List<String> backdropsList = <String>[];
        if (movie.hasData) {
          final backdrops = movie.data!.images!.backdrops;
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
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(movie.data!.title!),
          ),
          body: MovieHeader(movie.data!),
          // SwiperHeader(backdropsList),
        );
      },
    );
  }
}
