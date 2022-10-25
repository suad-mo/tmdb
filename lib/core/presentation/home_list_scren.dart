import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/list_movies/list_movies_bloc.dart';
import 'widgets/horizontal_scroll/scroll.dart';

class HomeListScren extends StatelessWidget {
  const HomeListScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Movie'),
      ),
      body: Column(
        children: [
          BlocBuilder<TrendingList, ListMoviesState>(builder: (_, state) {
            if (state is ListMoviesLoadingState) {
              return const Center(
                child: Text('Loading state'),
              );
            } else if (state is ListMoviesLoadedState) {
              return Scroll(
                items: state.moviesResponseEntity.movies,
                title: 'Trending movies',
                refreshCallback: () async {
                  BlocProvider.of<TrendingList>(context)
                      .add(const ListMoviesLoadEvent());
                },
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
            return const Center(child: Text('aaaaaaaaaaaa'));
          }),
          BlocBuilder<PopularList, ListMoviesState>(builder: (_, state) {
            if (state is ListMoviesLoadingState) {
              return const Center(
                child: Text('Loading state'),
              );
            } else if (state is ListMoviesLoadedState) {
              return Scroll(
                items: state.moviesResponseEntity.movies,
                title: 'Popular movies',
                refreshCallback: () async {
                  BlocProvider.of<PopularList>(context)
                      .add(const ListMoviesLoadEvent());
                },
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
            return const Center(child: Text('aaaaaaaaaaaa'));
          }),
        ],
      ),
    );
  }
}

class MoviesListHorizontal extends StatelessWidget {
  const MoviesListHorizontal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingList, ListMoviesState>(builder: (_, state) {
      if (state is ListMoviesLoadingState) {
        return const Center(
          child: Text('Loading state'),
        );
      } else if (state is ListMoviesLoadedState) {
        return Scroll(
          items: state.moviesResponseEntity.movies,
          title: 'Trending movies',
          refreshCallback: () async {
            BlocProvider.of<TrendingList>(context)
                .add(const ListMoviesLoadEvent());
          },
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
      return const Center(child: Text('aaaaaaaaaaaa'));
    });
  }
}
