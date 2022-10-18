import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/domain/entities/movies_response_entity.dart';

import 'package:tmdb/core/domain/use_cases/get_movies_response.dart';
import 'package:tmdb/core/domain/use_cases/params/movies_params.dart';

part 'list_movies_event.dart';
part 'list_movies_state.dart';

class ListMoviesBloc extends Bloc<ListMoviesEvent, ListMoviesState> {
  final GetMoviesResponse _getMoviesResponse;

  ListMoviesBloc({required GetMoviesResponse getMoviesResponse})
      : _getMoviesResponse = getMoviesResponse,
        super(ListMoviesInitial()) {
    on<ListMoviesLoadEvent>(_listMoviesEventHandler);
  }

  Future<void> _listMoviesEventHandler(
    ListMoviesLoadEvent event,
    Emitter<ListMoviesState> emit,
  ) async {
    emit(ListMoviesLoadingState());
    //final x = state.page + 1;
    final path = event._path;
    final query = event._query;

    final either = await _getMoviesResponse(
      MoviesParams(
        path: path,
        query: query,
      ),
    );

    await either.fold(
      (failure) async {
        emit(ListMoviesErrorState());
      },
      (moviesResponseEntity) async {
        emit(
          ListMoviesLoadedState(moviesResponseEntity: moviesResponseEntity),
        );
      },
    );
  }

  // void _emitListMovieRetrievalResult(Either<Failue<List<Movie>>)
}
