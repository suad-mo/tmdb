import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/core/data/api_client.dart';
import 'package:tmdb/core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import 'package:tmdb/core/data/repositories/movies_repository_impl.dart';
import 'package:tmdb/core/domain/entities/movies_response_entity.dart';
import 'package:tmdb/core/domain/repositories/movie_repository.dart';
import 'package:tmdb/core/domain/use_cases/get_movies_response.dart';
import 'package:tmdb/core/presentation/blocs/list_movies/list_movies_bloc.dart';

import '../providers/media_provider.dart';
import '../screens/poster_screen.dart';
import '../screens/home/home_screen.dart';
import '../providers/movie_provider.dart';
import 'core/presentation/home_list_scren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendingList>(
          create: (_) => ListMoviesBloc(
            path: '/3/trending/movie/day',
            getMoviesResponse: GetMoviesResponse(
              MovieRepositoryImpl(
                movieRemoteDataSource:
                    MovieRemoteDataSourceImpl(ApiClient(Client())),
              ),
            ),
          )..add(const ListMoviesLoadEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeListScren(),
        routes: {
          // MovieScreen.routeName: (ctx) => const MovieScreen(),
          PosterScreen.routeName: (ctx) => const PosterScreen(),
        },
      ),
    );
  }
}
