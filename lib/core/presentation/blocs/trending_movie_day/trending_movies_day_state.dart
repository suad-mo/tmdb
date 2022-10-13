part of 'trending_movies_day_bloc.dart';

@immutable
// ignore: must_be_immutable
class TrendingMoviesDayState extends Equatable {
  static const path = '3/trending/movie/day';
  int? page;
  int? totalPage;
  int? totalResult;
  List<MovieEntity>? movies;
  TrendingMoviesDayState({
    this.page,
    this.totalPage,
    this.totalResult,
    this.movies,
  });

  @override
  List<Object?> get props => [
        page,
        totalPage,
        totalResult,
        movies,
      ];
}

// ignore: must_be_immutable
class TrendingMoviesDayInitialState extends TrendingMoviesDayState {
  TrendingMoviesDayInitialState();
}

// ignore: must_be_immutable
class TrendingMoviesDayLoadingState extends TrendingMoviesDayState {}

// ignore: must_be_immutable
class TrendingMoviesDayErrorState extends TrendingMoviesDayState {}

// ignore: must_be_immutable
class TrendingMoviesDayLoadedState extends TrendingMoviesDayState {
  final MoviesResponseEntity moviesResponsEntity;

  TrendingMoviesDayLoadedState(this.moviesResponsEntity) {
    if (super.movies != null) {
      super.movies!.addAll(moviesResponsEntity.movies);
    } else {
      super.movies = moviesResponsEntity.movies;
    }
    super.page = moviesResponsEntity.page;
    super.totalPage = moviesResponsEntity.totalPages;
    super.totalResult = moviesResponsEntity.totalResults;
  }
}
