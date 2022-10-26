import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/scroll_list/scroll_list_bloc.dart';
import 'widgets/movies_grid/movies_grid_widget.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key, required this.bloc}) {
    // _scrollListBloc = getIt.get<ScrollListBloc>(instanceName: instanceName);
  }

  static String routeName = '/list-movies';
  // final String instanceName;
  final ScrollListBloc bloc;

  String get title {
    return bloc.path;
  }
  // late ScrollListBloc _scrollListBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<ScrollListBloc, ScrollListState>(
        bloc: bloc,
        builder: (context, state) {
          //print(state);
          if (state is ScrollListLoadedState) {
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
