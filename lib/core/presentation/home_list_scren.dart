import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/presentation/blocs/list_movies/list_movies_bloc.dart';
import 'package:tmdb/core/presentation/widgets/horizontal_scroll/scroll.dart';

class HomeListScren extends StatelessWidget {
  const HomeListScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Movie'),
      ),
      floatingActionButton: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          context.read<TrendingList>().add(const ListMoviesLoadEvent());
          // BlocProvider.of<TrendingList>(context)
          //     .add(const ListMoviesLoadEvent());
        },
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
                update: () async {
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
          // BlocBuilder<PopularList, ListMoviesState>(builder: (_, state) {
          //   if (state is ListMoviesLoadingState) {
          //     return const Center(
          //       child: Text('Loading state'),
          //     );
          //   } else if (state is ListMoviesLoadedState) {
          //     return Scroll(
          //       items: state.moviesResponseEntity.movies,
          //       update: () async {
          //         BlocProvider.of<PopularList>(context)
          //             .add(const ListMoviesLoadEvent());
          //       },
          //     );
          //   } else if (state is ListMoviesErrorState) {
          //     return const Center(
          //       child: Text('Error state'),
          //     );
          //   } else if (state is ListMoviesInitialState) {
          //     return const Center(
          //       child: Text('Initial State'),
          //     );
          //   }
          //   return const Center(child: Text('aaaaaaaaaaaa'));
          // }),
        ],
      ),
    );
  }
}
