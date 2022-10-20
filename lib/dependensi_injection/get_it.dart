import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tmdb/core/data/repositories/movies_repository_impl.dart';
import 'package:tmdb/core/domain/repositories/movie_repository.dart';
import 'package:tmdb/core/domain/use_cases/get_movies_response.dart';
import 'package:tmdb/core/presentation/blocs/list_movies/list_movies_bloc.dart';

import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source.dart';
import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import '../core/data/api_client.dart';

final getIt = GetIt.instance;

class AppGetIt {
  const AppGetIt._();

  static Future init() async {
    // presentation logic holder
    getIt.registerFactory(
      () => ListMoviesBloc(
          path: 'trending/movie/day',
          getMoviesResponse: getIt<GetMoviesResponse>()),
      instanceName: 'TendingListMovies',
    );

    // user case
    getIt.registerLazySingleton(
        () => GetMoviesResponse(getIt<MovieRepository>()));

    // repository
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: getIt<MovieRemoteDataSourceImpl>()));

    //data source
    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(getIt<ApiClient>()));

    // external
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(Client()));
  }
}
