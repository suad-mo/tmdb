import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/enums/movie_genres.dart';
import 'package:tmdb/core/presentation/widgets/drawers/filter_movies_drawer.dart';

import '../../dependensi_injection/get_it.dart';
import '../enums/type_list_movies.dart';
import 'blocs/movies_response/movies_response_bloc.dart';
import 'widgets/movies_grid/movies_grid_widget.dart';

// const Map<String, String> initialQuery = {
// 'sort_by': 'popularity.desc',
// 'aa':'nn',
//   };

class MoviesWidthTypeScreen extends StatefulWidget {
  MoviesWidthTypeScreen(
      {super.key, required this.bloc, required this.listMoviesType});

  MoviesWidthTypeScreen.onlyType({super.key, required this.listMoviesType})
      : bloc = getIt.get<MoviesResponseBloc>()
          ..add(MoviesResponseLoadEvent(listMoviesType: listMoviesType));

  MoviesWidthTypeScreen.withGenre({super.key, required MovieGenres movieGenres})
      : listMoviesType = ListMoviesType.discover,
        _movieGenres = movieGenres,
        bloc = getIt.get<MoviesResponseBloc>()
          ..add(MoviesResponseLoadEvent(
            listMoviesType: ListMoviesType.discover,
            query: {
              ...movieGenres.pathMap,
              'sort_by': 'popularity.desc',
            },
          ));

  static String routeName = '/list-movies';

  final ListMoviesType listMoviesType;
  final MoviesResponseBloc bloc;
  MovieGenres? _movieGenres;

  @override
  State<MoviesWidthTypeScreen> createState() => _MoviesWidthTypeScreenState();
}

class _MoviesWidthTypeScreenState extends State<MoviesWidthTypeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  Map<String, String>? _query;
  String get title => widget._movieGenres != null
      ? widget._movieGenres!.name
      : widget.listMoviesType.title;
  bool get isGenre => widget._movieGenres != null;

  @override
  void initState() {
    if (widget._movieGenres != null) {
      _query = {
        ...widget._movieGenres!.pathMap,
        'sort_by': 'popularity.desc',
      };
    }
    super.initState();
  }

  void changeQuery(Map<String, String> query) {
    setState(() {
      _query = query;
    });
    widget.bloc.add(MoviesResponseReloadEvent(
        listMoviesType: ListMoviesType.discover, query: _query));
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
          if (isGenre)
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
      endDrawer: widget._movieGenres != null
          ? FilterMoviesDrawer(
              changeQuery: changeQuery,
              query: _query ?? {},
              movieGenres: widget._movieGenres!,
            )
          : null,
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
                  listMoviesType: widget.listMoviesType, query: _query)),
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
