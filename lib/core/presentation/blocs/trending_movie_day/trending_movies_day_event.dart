part of 'trending_movies_day_bloc.dart';

abstract class TrendingMoviesDayEvent extends Equatable {
  const TrendingMoviesDayEvent();

  @override
  List<Object> get props => [];
}

class TrendingMoviesDayInit extends TrendingMoviesDayEvent {}
