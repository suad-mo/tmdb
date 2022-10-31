import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependensi_injection/get_it.dart';
import '../enums/type_list_movies.dart';
import 'blocs/movies_response/movies_response_bloc.dart';
import 'widgets/movies_grid/movies_grid_widget.dart';

class MoviesWidthTypeScreen extends StatelessWidget {
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

  String get title {
    return listMoviesType.title;
  }
  // late ScrollListBloc _scrollListBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<MoviesResponseBloc, MoviesResponseState>(
        bloc: bloc,
        builder: (context, state) {
          //print(state);

          if (state is MoviesResponseLoadedState) {
            final items = state.moviesResponseEntity.movies;
            return GridMoviesWidget(items: items);
          }

          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
