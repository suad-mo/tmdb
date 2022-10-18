import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source.dart';
import '../core/data/data_source/remote_data_source/movies_remote_data_source/movies_remote_data_source_impl.dart';
import '../core/data/api_client.dart';

final getIt = GetIt.instance;

class AppGetIt {
  const AppGetIt._();

  static Future init() async {
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(Client()));
    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(getIt<ApiClient>()));
  }
}
