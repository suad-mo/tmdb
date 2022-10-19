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
  final String path;
  final Map<String, String> query;
  ListMoviesBloc({
    required this.path,
    required this.query,
    required GetMoviesResponse getMoviesResponse,
  })  : _getMoviesResponse = getMoviesResponse,
        super(const ListMoviesInitialState()) {
    on<ListMoviesStarted>(
      (event, emit) {},
    );
    on<ListMoviesLoadEvent>(_listMoviesEventHandler);
  }

  Future<void> _listMoviesEventHandler(
    ListMoviesLoadEvent event,
    Emitter<ListMoviesState> emit,
  ) async {
    emit(const ListMoviesLoadingState());
    final state = this.state;
    if (state is ListMoviesInitialState) {
      final x = state.props.first;
    } else if (state is ListMoviesLoadedState) {
      final y = state.moviesResponseEntity;
    }
    final path = this.path;
    final query = this.query;
    //query.addAll({'page': '${state.props.moviesRepository + 1}'});

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
