part of 'movies_response_bloc.dart';

abstract class MoviesResponseEvent extends Equatable {
  const MoviesResponseEvent({required ListMoviesType listMoviesType})
      : _listMoviesType = listMoviesType;
  final ListMoviesType _listMoviesType;

  ListMoviesType get listMoviesType => _listMoviesType;

  @override
  List<Object?> get props => [listMoviesType];
}

class MoviesResponseLoadEvent extends MoviesResponseEvent {
  final Map<String, String>? query;

  const MoviesResponseLoadEvent({
    this.query,
    required ListMoviesType listMoviesType,
  }) : super(listMoviesType: listMoviesType);

  @override
  List<Object?> get props => [super.listMoviesType, query];
}

class MoviesResponseReloadEvent extends MoviesResponseEvent {
  final Map<String, String>? query;

  const MoviesResponseReloadEvent({
    this.query,
    required ListMoviesType listMoviesType,
  }) : super(listMoviesType: listMoviesType);

  @override
  List<Object?> get props => [super.listMoviesType, query];
}
