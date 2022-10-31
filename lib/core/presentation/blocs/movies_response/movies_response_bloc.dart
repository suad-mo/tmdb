import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/enums/type_list_movies.dart';

import '../../../domain/entities/movies_response_entity.dart';
import '../../../domain/use_cases/get_movies_response_with_request.dart';

part 'movies_response_event.dart';
part 'movies_response_state.dart';

class MoviesResponseBloc
    extends Bloc<MoviesResponseEvent, MoviesResponseState> {
  final GetMoviesResponseWithRequest _getMoviesResponseWithRequest;
  MoviesResponseBloc(
      {required GetMoviesResponseWithRequest getMoviesResponseWithRequest})
      : _getMoviesResponseWithRequest = getMoviesResponseWithRequest,
        super(MoviesResponseInitial()) {
    on<MoviesResponseLoadEvent>(_moviesResponseLoadEventHandler);
  }

  FutureOr<void> _moviesResponseLoadEventHandler(
    MoviesResponseLoadEvent event,
    Emitter<MoviesResponseState> emit,
  ) async {
    final state = this.state;
    final listMoviesType = event.listMoviesType;
    Map<String, String>? query = event.query;

    if (state is MoviesResponseInitial) {
      emit(const MoviesResponseLoadingState());

      query = query == null ? {'page': '1'} : {...query, 'page': '1'};

      final either = await _getMoviesResponseWithRequest(
        MoviesRequestParams(
          listMoviesType: listMoviesType,
          query: query,
        ),
      );

      await either.fold(
        (failure) async {
          emit(const MoviesResponseErrorState());
        },
        (moviesResponseEntity) async {
          emit(
            MoviesResponseLoadedState(
              moviesResponseEntity: moviesResponseEntity,
            ),
          );
        },
      );
    } else if (state is MoviesResponseLoadedState) {
      final MoviesResponseEntity oldMoviesResponseEntity = MoviesResponseEntity(
        page: state.moviesResponseEntity.page,
        movies: state.moviesResponseEntity.movies,
        totalPages: state.moviesResponseEntity.totalPages,
        totalResults: state.moviesResponseEntity.totalResults,
      );
      query = query == null
          ? {'page': '${state.moviesResponseEntity.page + 1}'}
          : {...query, 'page': '${state.moviesResponseEntity.page + 1}'};

      final either = await _getMoviesResponseWithRequest(
        MoviesRequestParams(
          listMoviesType: listMoviesType,
          query: query,
        ),
      );

      await either.fold(
        (failure) async {
          emit(MoviesResponseErrorState(
              oldMoviesResponseEntity: oldMoviesResponseEntity));
        },
        (moviesResponseEntity) async {
          final MoviesResponseEntity newMoviesResponseEntity =
              MoviesResponseEntity(
            page: moviesResponseEntity.page,
            movies: [
              ...oldMoviesResponseEntity.movies,
              ...moviesResponseEntity.movies,
            ],
            totalPages: state.moviesResponseEntity.totalPages,
            totalResults: moviesResponseEntity.totalResults,
          );
          emit(MoviesResponseLoadedState(
              moviesResponseEntity: newMoviesResponseEntity));
        },
      );
    }
  }
}
