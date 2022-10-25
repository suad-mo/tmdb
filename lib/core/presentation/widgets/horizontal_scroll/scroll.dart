import 'package:flutter/material.dart';

import '../../../domain/entities/movie_entity.dart';
import 'item_scroll.dart';

class Scroll extends StatefulWidget {
  const Scroll(
      {super.key,
      required this.items,
      required this.title,
      required this.refreshCallback});

  final List<MovieEntity> items;
  final String title;
  final RefreshCallback refreshCallback;

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  ScrollController _controller = ScrollController();

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

  Future<void> _refresh() {
    return widget.refreshCallback();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors
                  .black, // Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
          backgroundColor:
              Colors.white, // Theme.of(context).appBarTheme.surfaceTintColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: widget.refreshCallback,
              icon: const Icon(Icons.arrow_forward),
              color: Colors.black,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: RefreshIndicator(
            edgeOffset: 20,
            color: Colors.yellow,
            backgroundColor: Colors.red,
            onRefresh: _refresh,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) => ItemScroll(
                item: widget.items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
