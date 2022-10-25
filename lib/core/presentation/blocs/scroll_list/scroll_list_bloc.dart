import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movies_response_entity.dart';
import '../../../domain/use_cases/get_movies_response.dart';
import '../../../domain/use_cases/params/movies_params.dart';

part 'scroll_list_event.dart';
part 'scroll_list_state.dart';

class ScrollListBloc extends Bloc<ScrollListEvent, ScrollListState> {
  final GetMoviesResponse _getMoviesResponse;
  final String path;
  Map<String, String>? query;
  ScrollListBloc(
      {required this.path,
      this.query,
      required GetMoviesResponse getMoviesResponse})
      : _getMoviesResponse = getMoviesResponse,
        super(const ScrollListInitial()) {
    on<ScrollListLoadEvent>(_scrollListLoadEvent);
  }

  Future<void> _scrollListLoadEvent(
    ScrollListLoadEvent event,
    Emitter<ScrollListState> emit,
  ) async {
    final path = this.path;
    final state = this.state;
    Map<String, String>? query = this.query;

    if (state is ScrollListInitial) {
      emit(const ScrollListLoadingState());
      final either = await _getMoviesResponse(
        MoviesParams(
          path: path,
          query: query,
        ),
      );

      await either.fold(
        (failure) async {
          emit(const ScrollListErrorState());
        },
        (moviesResponseEntity) async {
          emit(
            ScrollListLoadedState(moviesResponseEntity: moviesResponseEntity),
          );
        },
      );
    } else if (state is ScrollListLoadedState) {
      final MoviesResponseEntity oldMoviesResEntity = MoviesResponseEntity(
        page: state.moviesResponseEntity.page,
        movies: state.moviesResponseEntity.movies,
        totalPages: state.moviesResponseEntity.totalPages,
        totalResults: state.moviesResponseEntity.totalResults,
      );
      query = {'page': '${state.moviesResponseEntity.page + 1}'};

      final either = await _getMoviesResponse(
        MoviesParams(
          path: path,
          query: query,
        ),
      );
      await either.fold(
        (failure) async {
          emit(ScrollListErrorState(moviesResponseEntity: oldMoviesResEntity));
        },
        (moviesResponseEntity) async {
          final MoviesResponseEntity newMoviesResEntity = MoviesResponseEntity(
            page: moviesResponseEntity.page,
            movies: [
              ...oldMoviesResEntity.movies,
              ...moviesResponseEntity.movies,
            ],
            totalPages: state.moviesResponseEntity.totalPages,
            totalResults: moviesResponseEntity.totalResults,
          );
          emit(
            ScrollListLoadedState(moviesResponseEntity: newMoviesResEntity),
          );
        },
      );
    }
  }
}
