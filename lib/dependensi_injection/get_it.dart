import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../core/data/repositories/movies_repository_impl.dart';
import '../core/domain/repositories/movie_repository.dart';
import '../core/domain/use_cases/get_movies_response.dart';

import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source.dart';
import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import '../core/data/api_client.dart';
import '../core/domain/use_cases/get_movies_response_with_request.dart';
import '../core/presentation/blocs/scroll_list/scroll_list_bloc.dart';
import '../core/presentation/blocs/movies_response/movies_response_bloc.dart';

final getIt = GetIt.instance;

// ignore: constant_identifier_names
enum TypeScrollList { Trending, Popular }

// extension Path on TypeScrollList {
//   String get path {
//     switch (TypeScrollList) {
//       case TypeScrollList.Popular:
//         return '/3/movie/popular';
//       default:
//     }
//   }
// }

class AppGetIt {
  const AppGetIt._();

  static Future init() async {
    // presentation logic holder
    getIt.registerFactory(
        () => ScrollListBloc(
              path: '/3/trending/movie/day',
              getMoviesResponse: getIt<GetMoviesResponse>(),
            ),
        instanceName: TypeScrollList.Trending.name // 'Trending',
        );

    getIt.registerFactory(
      () => ScrollListBloc(
        path: '/3/movie/popular',
        getMoviesResponse: getIt<GetMoviesResponse>(),
      ),
      instanceName: 'Popular',
    );

    // getIt.registerFactoryParam(
    //   (param1, param2) => ScrollListBloc(
    //     path: param1.toString(),
    //     getMoviesResponse: getIt<GetMoviesResponse>(),
    //   ),
    // );
    // getIt.registerFactory(
    //   () => ListMoviesBloc(
    //     path: '/3/movie/popular',
    //     getMoviesResponse: getIt<GetMoviesResponse>(),
    //   ) as PopularList,
    // );

    getIt.registerFactory(
      () => MoviesResponseBloc(
          getMoviesResponseWithRequest: getIt<GetMoviesResponseWithRequest>()),
    );

    // user case
    getIt.registerLazySingleton(
        () => GetMoviesResponse(getIt<MovieRepository>()));

    getIt.registerLazySingleton(
        () => GetMoviesResponseWithRequest(getIt<MovieRepository>()));

    // repository
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: getIt<MovieRemoteDataSource>()));

    //data source
    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(getIt<ApiClient>()));

    // external
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(Client()));
  }

  static Future addScrollListBloc({
    required String path,
    required String instanceName,
  }) async {
    // presentation logic holder
    getIt.registerFactory(
      () => ScrollListBloc(
        path: path,
        getMoviesResponse: getIt<GetMoviesResponse>(),
      ),
      instanceName: instanceName,
    );
  }
}
