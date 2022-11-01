import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/presentation/widgets/drawers/filter_movies_drawer.dart';

import '../../dependensi_injection/get_it.dart';
import '../enums/type_list_movies.dart';
import 'blocs/movies_response/movies_response_bloc.dart';
import 'widgets/movies_grid/movies_grid_widget.dart';

class MoviesWidthTypeScreen extends StatefulWidget {
  const MoviesWidthTypeScreen(
      {super.key, required this.bloc, required this.listMoviesType});

  MoviesWidthTypeScreen.onlyType({super.key, required this.listMoviesType})
      : bloc = getIt.get<MoviesResponseBloc>()
          ..add(MoviesResponseLoadEvent(listMoviesType: listMoviesType));
  //      {
  //   bloc = getIt.get<MoviesResponseBloc>()
  //     ..add(MoviesResponseLoadEvent(listMoviesType: listMoviesType));
  // }

  static String routeName = '/list-movies';
  final ListMoviesType listMoviesType;
  final MoviesResponseBloc bloc;

  @override
  State<MoviesWidthTypeScreen> createState() => _MoviesWidthTypeScreenState();
}

class _MoviesWidthTypeScreenState extends State<MoviesWidthTypeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  String get title {
    return widget.listMoviesType.title;
  }

  // late ScrollListBloc _scrollListBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(title),
        // automaticallyImplyLeading: true, //neće dodati dugme za povratak
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _key.currentState!.openEndDrawer(); //<-- SEE HERE
              print('Yyyyyy...');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MoviesWidthTypeScreen(
              //       bloc: widget._bloc,
              //       listMoviesType: widget.listMoviesType,
              //       // instanceName: widget.instanceName,
              //     ),
              //   ),
              // );
            },
            icon: const Icon(Icons.tune),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      endDrawer: const FilterMoviesDrawer(),
      endDrawerEnableOpenDragGesture: false,
      // dr
      drawerEnableOpenDragGesture: false,
      body: BlocBuilder<MoviesResponseBloc, MoviesResponseState>(
        bloc: widget.bloc,
        builder: (context, state) {
          //print(state);

          if (state is MoviesResponseLoadedState) {
            final items = state.moviesResponseEntity.movies;
            return GridMoviesWidget(
              items: items,
              refresh: () => widget.bloc.add(MoviesResponseLoadEvent(
                  listMoviesType: widget.listMoviesType)),
            );
          }

          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
