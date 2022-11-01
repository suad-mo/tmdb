import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/domain/use_cases/params/movies_params.dart';

import '../../dependensi_injection/get_it.dart';
import 'blocs/scroll_list/scroll_list_bloc.dart';
import 'widgets/movies_grid/movies_grid_widget.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key, required this.bloc}) {
    // _scrollListBloc = getIt.get<ScrollListBloc>(instanceName: instanceName);
  }

  MoviesScreen.withName({super.key, required String instanceName}) {
    bloc = getIt.get<ScrollListBloc>(instanceName: instanceName)
      ..add(const ScrollListLoadEvent());
  }

  MoviesScreen.withParams(
      {super.key, required String instanceName, required MoviesParams params}) {
    bloc = getIt.get<ScrollListBloc>(instanceName: instanceName)
      ..add(ScrollListLoadWithParamsEvent(
          path: params.path, query: params.query));
  }

  static String routeName = '/list-movies';
  // final String instanceName;
  late final ScrollListBloc bloc;

  String get title {
    return bloc.path;
  }
  // late ScrollListBloc _scrollListBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
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
            icon: const Icon(Icons.arrow_forward),
            color: Colors.black,
          ),
        ],
      ),
      body: BlocBuilder<ScrollListBloc, ScrollListState>(
        bloc: bloc,
        builder: (context, state) {
          //print(state);
          if (state is ScrollListLoadedState) {
            final items = state.moviesResponseEntity.movies;
            return GridMoviesWidget(
              items: items,
              refresh: () {},
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
