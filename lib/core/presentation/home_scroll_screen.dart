import 'package:flutter/material.dart';
import 'package:tmdb/core/enums/type_list_movies.dart';
import 'package:tmdb/core/presentation/widgets/movies_response/scroll_list_with_type.dart';

// import 'widgets/horiz_scroll_list_widget/horiz_scroll_list_widget.dart';

class HomeScrollScreen extends StatelessWidget {
  const HomeScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // Theme.of(context).primaryColorLight,
        foregroundColor: Colors.black,
        title: const Text(
          'TMBD Movies',
          style: TextStyle(fontSize: 24),
        ),
        // actions: [
        // IconButton(
        //   onPressed: () {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => MoviesWidthTypeScreen.withGenre(
        //     //       movieGenres: MovieGenres.action,
        //     //       // instanceName: widget.instanceName,
        //     //     ),
        //     //   ),
        //     // );
        //   },
        //   icon: const Icon(Icons.add),
        // ),
        // ],
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
