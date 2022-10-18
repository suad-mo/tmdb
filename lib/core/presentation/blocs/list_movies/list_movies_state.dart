part of 'list_movies_bloc.dart';

// ignore: must_be_immutable
abstract class ListMoviesState extends Equatable {
  ListMoviesState({
    this.page,
    this.totalPages,
    this.totalResults,
  });
  final List<MovieEntity> _items = <MovieEntity>[];

  List<MovieEntity> get items => _items;

  // set items(List<MovieEntity> items) {
  //   _items = items;
  // }
  int? page;
  int? totalPages;
  int? totalResults;

  void _addItems(List<MovieEntity> newItems) {
    items.addAll(newItems);
  }

  @override
  List<Object?> get props => [_items, page, totalPages, totalResults];
}

@immutable
class ListMoviesInitial extends ListMoviesState {
  ListMoviesInitial() : super(page: 0, totalPages: 0, totalResults: 0);
}

@immutable
class ListMoviesLoadingState extends ListMoviesState {}

@immutable
class ListMoviesLoadedState extends ListMoviesState {
  final MoviesResponseEntity moviesResponseEntity;

  ListMoviesLoadedState({
    required this.moviesResponseEntity,
  }) {
    _addItems(moviesResponseEntity.movies);
    page = moviesResponseEntity.page;
    totalPages = moviesResponseEntity.totalPages;
    totalPages = moviesResponseEntity.totalResults;
  }

  @override
  List<Object> get props => [moviesResponseEntity];
}

class ListMoviesErrorState extends ListMoviesState {}
