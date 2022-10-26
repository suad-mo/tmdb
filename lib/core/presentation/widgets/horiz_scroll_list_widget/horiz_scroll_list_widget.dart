import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movies_screen.dart';
import '../../../../dependensi_injection/get_it.dart';
import '../../blocs/scroll_list/scroll_list_bloc.dart';
import '../horizontal_scroll/item_scroll.dart';

// ignore: must_be_immutable
class HorizScrollListWidget extends StatefulWidget {
  HorizScrollListWidget({super.key, required this.instanceName}) {
    _scrollListBloc = getIt.get<ScrollListBloc>(instanceName: instanceName)
      ..add(const ScrollListLoadEvent());
  }

  final String instanceName;
  late ScrollListBloc _scrollListBloc;

  @override
  State<HorizScrollListWidget> createState() => _HorizScrollListWidgetState();
}

class _HorizScrollListWidgetState extends State<HorizScrollListWidget> {
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

  Future<void> _refresh() async {
    return widget._scrollListBloc.add(const ScrollListLoadEvent());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late ScrollListBloc
    //     x; //= getIt.get<ScrollListBloc>(instanceName: instanceName);
    // x.add(const ScrollListLoadEvent());
    return Column(
      children: <Widget>[
        AppBar(
          elevation: 0,
          title: Text(
            widget.instanceName,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviesScreen(
                      bloc: widget._scrollListBloc,
                      // instanceName: widget.instanceName,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              color: Colors.black,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: BlocBuilder<ScrollListBloc, ScrollListState>(
              bloc: widget._scrollListBloc,
              builder: (context, state) {
                // final state = context.read<ScrollListBloc>().state;
                //print(state.toString());
                if (state is ScrollListLoadedState) {
                  final items = state.moviesResponseEntity.movies;
                  return RefreshIndicator(
                    edgeOffset: 20,
                    color: Colors.yellow,
                    backgroundColor: Colors.red,
                    onRefresh: () async =>
                        widget._scrollListBloc.add(const ScrollListLoadEvent()),
                    child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) => ItemScroll(
                        item: items[index],
                      ),
                    ),
                  );
                } else if (state is ScrollListLoadingState) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else if (state is ScrollListErrorState) {
                  return const Center(
                    child: Text('Error...'),
                  );
                } else {
                  return const Center(
                    child: Text('Somthing else...'),
                  );
                }
              }),
        ),
      ],
    );
  }
}
