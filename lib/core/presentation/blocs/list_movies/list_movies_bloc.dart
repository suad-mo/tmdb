import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/domain/use_cases/get_list_movies.dart';
import 'package:tmdb/core/domain/use_cases/params/movies_params.dart';

part 'list_movies_event.dart';
part 'list_movies_state.dart';

class ListMoviesBloc extends Bloc<ListMoviesEvent, ListMoviesState> {
  final GetListMovies _getListMovies;

  ListMoviesBloc({required GetListMovies getListMovies})
      : _getListMovies = getListMovies,
        super(ListMoviesInitial()) {
    on<ListMoviesLoadEvent>(_listMoviesEventHandler);
  }

  Future<void> _listMoviesEventHandler(
    ListMoviesLoadEvent event,
    Emitter<ListMoviesState> emit,
  ) async {
    emit(ListMoviesLoadingState());
    final path = event._path;
    final query = event._query;

    final either = await _getListMovies(
      MoviesParams(
        path: path,
        query: query,
      ),
    );

    await either.fold(
      (failure) async {
        emit(ListMoviesErrorState());
      },
      (listMovieEntity) async {
        emit(
          ListMoviesLoadedState(listMovieEntity: listMovieEntity),
        );
      },
    );
  }

  // void _emitListMovieRetrievalResult(Either<Failue<List<Movie>>)
}
