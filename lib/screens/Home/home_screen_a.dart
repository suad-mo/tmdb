import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/models/info_list_tmdb.dart';
import 'package:tmdb/widgets/horizontal_scrol.dart';
import 'package:tmdb/widgets/horizontal_scrol_a.dart';
import '../../providers/media_provider.dart';

class HomeScreenA extends StatelessWidget {
  const HomeScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media App')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // HorizontalScrol(TypeListMedia.trendingMovieWeek),
            HorizontalScrolA(TypeListMedia.trendingMovieWeek),
            // HorizontalScrol(TypeListMedia.moviePopular),
            HorizontalScrolA(TypeListMedia.moviePopular),
            // HorizontalScrol(TypeListMedia.trendingMovieWeek),
          ],
        ),
      ),
    );
  }
}
