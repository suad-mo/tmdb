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
        title: const Text('Lost movies'),
      ),
      body: Column(
        children: <Widget>[
          // HorizScrollListWidget(instanceName: 'Trending'),
          // HorizScrollListWidget(instanceName: 'Trending'),
          // HorizScrollListWidget(instanceName: 'Popular'),
          ScrollListWithTypeWidget(listMoviesType: ListMoviesType.trending),
          ScrollListWithTypeWidget(listMoviesType: ListMoviesType.popular),
        ],
      ),
    );
  }
}
