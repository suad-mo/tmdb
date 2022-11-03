import 'package:flutter/material.dart';
import 'package:tmdb/core/enums/movie_genres.dart';
import 'package:tmdb/core/enums/type_list_movies.dart';
import 'package:tmdb/core/presentation/widgets/movies_response/scroll_list_with_type.dart';

import 'movies_with_type_screen.dart';

// import 'widgets/horiz_scroll_list_widget/horiz_scroll_list_widget.dart';

class HomeScrollScreen extends StatelessWidget {
  const HomeScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoviesWidthTypeScreen.withGenre(
                    movieGenres: MovieGenres.action,
                    // instanceName: widget.instanceName,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // HorizScrollListWidget(instanceName: 'Trending'),
            // HorizScrollListWidget(instanceName: 'Trending'),
            // HorizScrollListWidget(instanceName: 'Popular'),
            ScrollListWithTypeWidget(
                listMoviesType: ListMoviesType.trendingWeek),
            ScrollListWithTypeWidget(listMoviesType: ListMoviesType.popular),
            ScrollListWithTypeWidget(listMoviesType: ListMoviesType.nowPlaying),
          ],
        ),
      ),
    );
  }
}
