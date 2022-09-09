import 'package:flutter/material.dart';

import '../../models/info_list_tmdb.dart';
import '../../widgets/scroll/horizontal_scroll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Media App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: (() {}), icon: const Icon(Icons.movie_filter))
        ],
        backgroundColor:
            Colors.white, // Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            HorizontalScroll(TypeListMedia.trendingMovieWeek),
            HorizontalScroll(TypeListMedia.moviePopular),
            HorizontalScroll(TypeListMedia.movieTopRated),
          ],
        ),
      ),
    );
  }
}
