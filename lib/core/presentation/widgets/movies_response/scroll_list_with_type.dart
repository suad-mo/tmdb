import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/dependensi_injection/get_it.dart';

import '../../../enums/type_list_movies.dart';
import '../../blocs/movies_response/movies_response_bloc.dart';
import '../../movies_with_type_screen.dart';
import '../horizontal_scroll/item_scroll.dart';

// ignore: must_be_immutable
class ScrollListWithTypeWidget extends StatefulWidget {
  ScrollListWithTypeWidget({super.key, required this.listMoviesType}) {
    _bloc = getIt<MoviesResponseBloc>()
      ..add(MoviesResponseLoadEvent(listMoviesType: listMoviesType));
  }

  final ListMoviesType listMoviesType;
  late MoviesResponseBloc _bloc;

  @override
  State<ScrollListWithTypeWidget> createState() =>
      _ScrollListWithTypeWidgetState();
}

class _ScrollListWithTypeWidgetState extends State<ScrollListWithTypeWidget> {
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
    return widget._bloc
        .add(MoviesResponseLoadEvent(listMoviesType: widget.listMoviesType));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          elevation: 0,
          title: Text(
            widget.listMoviesType.title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviesWidthTypeScreen.onlyType(
                      // bloc: widget._bloc,
                      listMoviesType: widget.listMoviesType,
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
          child: BlocBuilder<MoviesResponseBloc, MoviesResponseState>(
              bloc: widget._bloc,
              builder: (context, state) {
                // final state = context.read<ScrollListBloc>().state;
                //print(state.toString());
                if (state is MoviesResponseLoadedState) {
                  final items = state.moviesResponseEntity.movies;
                  return RefreshIndicator(
                    edgeOffset: 20,
                    color: Colors.yellow,
                    backgroundColor: Colors.red,
                    onRefresh: () async => widget._bloc.add(
                        MoviesResponseLoadEvent(
                            listMoviesType: widget.listMoviesType)),
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
                } else if (state is MoviesResponseLoadingState) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else if (state is MoviesResponseErrorState) {
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

// BlocBuilder<MoviesResponseBloc, MoviesResponseState>(
//       bloc: widget._bloc,
//       builder: (context, state) {
//         return Container();
//       },
//     )