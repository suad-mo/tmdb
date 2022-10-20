import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/presentation/blocs/list_movies/list_movies_bloc.dart';

class HomeListScren extends StatelessWidget {
  const HomeListScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Movie')),
      body: BlocBuilder<TrendingList, ListMoviesState>(builder: (_, state) {
        if (state is ListMoviesLoadingState) {
          return const Center(
            child: Text('Loading state'),
          );
        } else if (state is ListMoviesLoadedState) {
          return const Center(
            child: Text('Loaded state'),
          );
        } else if (state is ListMoviesErrorState) {
          return const Center(
            child: Text('Error state'),
          );
        } else if (state is ListMoviesInitialState) {
          return const Center(
            child: Text('Initial State'),
          );
        }
        return Container(
          child: Text('aaaaaaaaaaaa'),
        );
      }),
    );
  }
}
