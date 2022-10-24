// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/domain/entities/movies_response_entity.dart';

import 'package:tmdb/core/domain/use_cases/get_movies_response.dart';
import 'package:tmdb/core/domain/use_cases/params/movies_params.dart';

// import '../../../error/failures/failure.dart';

part 'list_movies_event.dart';
part 'list_movies_state.dart';

mixin TrendingList on Bloc<ListMoviesEvent, ListMoviesState> {}
mixin PopularList on Bloc<ListMoviesEvent, ListMoviesState> {}

class ListMoviesBloc extends Bloc<ListMoviesEvent, ListMoviesState>
    with TrendingList, PopularList {
  final GetMoviesResponse _getMoviesResponse;
  final String path;
  // Map<String, String>? query;
  ListMoviesBloc({
    required this.path,
    // this.query,
    required GetMoviesResponse getMoviesResponse,
  })  : _getMoviesResponse = getMoviesResponse,
        super(const ListMoviesInitialState()) {
    on<ListMoviesLoadEvent>(_listMoviesLoadEventHandler);
  }

  Future<void> _listMoviesLoadEventHandler(
    ListMoviesLoadEvent event,
    Emitter<ListMoviesState> emit,
  ) async {
    final path = this.path;
    final state = this.state;
    Map<String, String>? query; // = <String, String>{'page': '1'};

    if (state is ListMoviesInitialState) {
      emit(const ListMoviesLoadingState());
      query = {'page': '1'};

      final either = await _getMoviesResponse(
        MoviesParams(
          path: path,
          query: query,
        ),
      );
      print(path);
      await either.fold(
        (failure) async {
          emit(const ListMoviesErrorState());
        },
        (moviesResponseEntity) async {
          emit(
            ListMoviesLoadedState(moviesResponseEntity: moviesResponseEntity),
          );
        },
      );
    } else if (state is ListMoviesLoadedState) {
      final MoviesResponseEntity oldMoviesResEntity = MoviesResponseEntity(
        page: state.moviesResponseEntity.page,
        movies: state.moviesResponseEntity.movies,
        totalPages: state.moviesResponseEntity.totalPages,
        totalResults: state.moviesResponseEntity.totalResults,
      );
      // emit(
      //   ListMoviesLoadingState(
      //       moviesResponseEntity: state.moviesResponseEntity),
      // );
      query = {'page': '${state.moviesResponseEntity.page + 1}'};

      final either = await _getMoviesResponse(
        MoviesParams(
          path: path,
          query: query,
        ),
      );
      await either.fold(
        (failure) async {
          emit(ListMoviesErrorState(moviesResponseEntity: oldMoviesResEntity));
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
            ListMoviesLoadedState(moviesResponseEntity: newMoviesResEntity),
          );
        },
      );
    }

    // final either = await _getMoviesResponse(
    //   MoviesParams(
    //     path: path,
    //     query: query,
    //   ),
    // );
  }
}
