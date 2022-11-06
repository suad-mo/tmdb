import 'package:flutter/material.dart';

import './tabs/about_tab.dart';
import '../../helpers/tmbd_res_data.dart';
import '../../models/movie.dart';
import '../../widgets/cast/cast_list.dart';
import '../../widgets/movie/movie_header.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen(this.id, {super.key});
  final int id;
  final ScrollController _controller = ScrollController();

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
          if (backdrops != null && backdrops.isNotEmpty) {
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
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                SliverAppBar(
                  title: _controller.initialScrollOffset > 500
                      ? const Text('aaa')
                      : const Text(''),
                  automaticallyImplyLeading: true,
                  // collapsedHeight: 120,
                  elevation: 0,

                  stretchTriggerOffset: 50,
                  onStretchTrigger: () async {
                    //print('Wwwwwwww........');
                  },
                  actions: [
                    IconButton(
                      onPressed: (() {}),
                      icon: const Icon(Icons.add),
                      alignment: Alignment.center,
                    )
                  ],
                  excludeHeaderSemantics: true,
                  floating: true, // Nestaje appbar
                  // automaticallyImplyLeading: false, // nema back button
                  leading: Container(
                    margin: const EdgeInsets.all(6),
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.black26,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        onPressed: (() {
                          Navigator.of(context).pop();
                        }),
                      ),
                    ),
                  ),
                  foregroundColor: Colors.black54,
                  expandedHeight: 400,
                  backgroundColor: Colors.white,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    stretchModes: const [StretchMode.fadeTitle],
                    collapseMode: CollapseMode.pin,
                    background: movie.data != null
                        ? MovieHeader(movie.data!)
                        : Container(), //null,
                  ),
                  bottom: const TabBar(
                    padding: EdgeInsets.all(0),
                    tabs: [
                      Tab(
                        child: Text(
                          'ABOUT',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'CAST',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Tab(
                          icon: Icon(
                        Icons.directions_car,
                        color: Colors.amber,
                      )),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(0),
                      height: 850,
                      child: TabBarView(children: [
                        AboutTab(movie.data!),
                        CastList(id),
                        CastList(id),
                      ]),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
