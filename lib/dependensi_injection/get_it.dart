import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tmdb/features/person/domain/use_case/get_person_tv_cast.dart';
import 'package:tmdb/features/person/presentation/blocs/person_movie_cast/person_movie_cast_bloc.dart';
import 'package:tmdb/features/person/presentation/blocs/person_tv_cast/person_tv_cast_bloc.dart';

import '../features/person/data/data_sources/remote_data_source.dart/person_detail_remote_data_source.dart';
import '../features/person/data/repositories/person_detail_repository_impl.dart';
import '../features/person/domain/repositories/person_detail_repository.dart';
import '../features/person/domain/use_case/get_person_detail.dart';
import '../features/person/domain/use_case/get_person_movie_cast.dart';
import '../features/person/presentation/blocs/person_detail_bloc/person_detail_bloc.dart';

import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source.dart';
import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import '../core/data/repositories/movies_repository_impl.dart';
import '../core/data/api_client.dart';

import '../core/domain/repositories/movie_repository.dart';
import '../core/domain/use_cases/get_movies_response.dart';
import '../core/domain/use_cases/get_movies_response_with_request.dart';

import '../core/presentation/blocs/scroll_list/scroll_list_bloc.dart';
import '../core/presentation/blocs/movies_response/movies_response_bloc.dart';

final getIt = GetIt.instance;

// ignore: constant_identifier_names
enum TypeScrollList { Trending, Popular }

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

    getIt.registerFactory(
      () => PersonDetailBloc(
          getPersonDetailUseCase: getIt<GetPersonDetailUseCase>()),
    );

    getIt.registerFactory(() => PersonMovieCastBloc(
        getPersonMovieCastsUseCase: getIt<GetPersonMovieCastsUseCase>()));

    getIt.registerFactory(() => PersonTvCastBloc(
        getPersonTvCastsUseCase: getIt<GetPersonTvCastsUseCase>()));

    // user case
    getIt.registerLazySingleton(
        () => GetMoviesResponse(getIt<MovieRepository>()));

    getIt.registerLazySingleton(
        () => GetMoviesResponseWithRequest(getIt<MovieRepository>()));

    getIt.registerLazySingleton(() => GetPersonDetailUseCase(
        personDetailRepository: getIt<PersonDetailRepository>()));

    getIt.registerLazySingleton(
        () => GetPersonMovieCastsUseCase(getIt<PersonDetailRepository>()));

    getIt.registerLazySingleton(
        () => GetPersonTvCastsUseCase(getIt<PersonDetailRepository>()));

    // repository
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: getIt<MovieRemoteDataSource>()));

    getIt.registerLazySingleton<PersonDetailRepository>(() =>
        PersonDetailRepositoryImpl(
            personDetailRemoteDataSource:
                getIt<PersonDetailRemoteDataSource>()));

    //data source
    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(getIt<ApiClient>()));

    getIt.registerLazySingleton<PersonDetailRemoteDataSource>(
        () => PersonDetailRemoteDataSourceImpl(getIt<ApiClient>()));

    //getIt.registerLazySingleton<PersonMovieC>(() => null)

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
