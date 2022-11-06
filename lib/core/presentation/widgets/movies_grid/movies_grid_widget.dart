import 'package:flutter/material.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../../screens/movie/movie_screen.dart';

class GridMoviesWidget extends StatefulWidget {
  const GridMoviesWidget(
      {super.key, required this.items, required this.refresh});

  final List<MovieEntity> items;
  final VoidCallback refresh;

  @override
  State<GridMoviesWidget> createState() => _GridMoviesWidgetState();
}

class _GridMoviesWidgetState extends State<GridMoviesWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _refresh();
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  Future<void> _refresh() async {
    // return widget._bloc
    //     .add(MoviesResponseLoadEvent(listMoviesType: widget.listMoviesType));
    // print('OnRefresh');
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // print('onRefresh');
      },
      child: GridView.builder(
        // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        controller: _controller,
        // reverse: true,
        // physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.67,
          crossAxisSpacing: 3,
          // mainAxisSpacing: 3,
        ),
        itemCount: widget.items.length,

        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              maintainState: false,
                              builder: (context) {
                                return MovieScreen(
                                    widget.items[index].id.toInt());
                              },
                            ),
                          );
                        },
                        child: Image(
                          image: NetworkImage(widget.items[index].posterPath),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator()),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: Text(
                          widget.items[index].voteAverage.toStringAsFixed(1),
                          style: const TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
