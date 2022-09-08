import 'package:flutter/material.dart';
import 'package:tmdb/models/info_list_tmdb.dart';
import 'package:tmdb/widgets/horizontal_scrol_a.dart';

import '../../widgets/horizontal_scrol.dart';

class HomeScreenA extends StatelessWidget {
  const HomeScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media App')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HorizontalScrolA(TypeListMedia.trendingMovieWeek),
            HorizontalScrol(TypeListMedia.trendingMovieWeek),
            HorizontalScrolA(TypeListMedia.moviePopular),
            HorizontalScrol(TypeListMedia.moviePopular),
          ],
        ),
      ),
    );
  }
}
