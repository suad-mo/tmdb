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
        onPressed: () {
          BlocProvider.of<TrendingList>(context)
              .add(const ListMoviesLoadEvent());
        },
      ),
      body: BlocBuilder<TrendingList, ListMoviesState>(builder: (_, state) {
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
          // Center(
          //   child: RefreshIndicator(
          //     notificationPredicate: (notification) => true,
          //     edgeOffset: 20,
          //     color: Colors.yellow,
          // onRefresh: () async {
          //   BlocProvider.of<TrendingList>(context)
          //       .add(const ListMoviesLoadEvent());
          // },
          //     child: ListView.builder(
          //       itemCount: state.moviesResponseEntity.movies.length,
          //       itemBuilder: ((_, i) => ListTile(
          //             title: Text(
          //                 '${i + 1}: ${state.moviesResponseEntity.movies[i].title}'),
          //           )),
          //     ),
          //   ),
          // );
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
    );
  }
}
