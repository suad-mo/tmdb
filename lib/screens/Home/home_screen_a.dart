import 'package:flutter/material.dart';
import 'package:tmdb/models/info_list_tmdb.dart';
//import 'package:tmdb/widgets/horizontal_scrol_a.dart';
import 'package:tmdb/widgets/horizontal_scrol_b.dart';

//import '../../widgets/horizontal_scrol.dart';

class HomeScreenA extends StatelessWidget {
  const HomeScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media App')),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            HorizontalScrolB(TypeListMedia.trendingMovieWeek),
            HorizontalScrolB(TypeListMedia.movieTopRated),
            HorizontalScrolB(TypeListMedia.movieNowPlaying),
            HorizontalScrolB(TypeListMedia.moviePopular),
            HorizontalScrolB(TypeListMedia.movieUpcoming),
          ],
        ),
      ),
    );
  }
}
