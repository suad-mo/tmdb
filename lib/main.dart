import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'dependensi_injection/get_it.dart';
import 'core/presentation/home_scroll_screen.dart';
import 'core/data/api_client.dart';
import 'core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import 'core/data/repositories/movies_repository_impl.dart';

import 'core/domain/use_cases/get_movies_response.dart';
import 'core/presentation/blocs/list_movies/list_movies_bloc.dart';

import '../screens/poster_screen.dart';

// import 'core/presentation/home_list_scren.dart';

void main() {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  AppGetIt.init().then((_) => runApp(const MyApp()));
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
        BlocProvider<PopularList>(
          create: (_) => ListMoviesBloc(
            path: '/3/movie/popular',
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
        home: const HomeScrollScreen(),
        routes: {
          // MoviesScreen.routeName: (ctx) => const MoviesScreen(),
          PosterScreen.routeName: (ctx) => const PosterScreen(),
        },
      ),
    );
  }
}
