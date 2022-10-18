import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/domain/use_cases/get_movies_response.dart';
import 'package:tmdb/models/movie.dart';

import '../../../domain/entities/movies_response_entity.dart';
import '../../../domain/use_cases/params/movies_params.dart';

part 'trending_movies_day_event.dart';
part 'trending_movies_day_state.dart';

class TrendingMoviesDayBloc
    extends Bloc<TrendingMoviesDayEvent, TrendingMoviesDayState> {
  final GetMoviesResponse getMoviesResponse;
  TrendingMoviesDayBloc(this.getMoviesResponse)
      : super(TrendingMoviesDayInitialState()) {
    on<TrendingMoviesDayInit>(_getMoviesResponseEventHandler);
  }

  Future<void> _getMoviesResponseEventHandler(
    TrendingMoviesDayInit event,
    Emitter<TrendingMoviesDayState> emit,
  ) async {
    emit(TrendingMoviesDayLoadingState());
    const path = '/3/trending/movie/day';
    final query = {
      'page': (state.page != null ? (state.page! + 1) : 1).toString()
    };

    final either = await getMoviesResponse(
      MoviesParams(
        path: path,
        query: query,
      ),
    );

    await either.fold(
      (failure) async {
        emit(TrendingMoviesDayErrorState());
      },
      (moviesResponsEntity) async {
        emit(
          TrendingMoviesDayLoadedState(moviesResponsEntity),
        );
      },
    );
  }
}
