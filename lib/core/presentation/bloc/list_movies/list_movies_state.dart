part of 'list_movies_bloc.dart';

abstract class ListMoviesState extends Equatable {
  const ListMoviesState();

  @override
  List<Object> get props => [];
}

class ListMoviesInitial extends ListMoviesState {}

class ListMoviesLoadingState extends ListMoviesState {}

class ListMoviesLoadedState extends ListMoviesState {
  final List<MovieEntity> listMovieEntity;

  const ListMoviesLoadedState({
    required this.listMovieEntity,
  });

  @override
  List<Object> get props => [listMovieEntity];
}

class ListMoviesErrorState extends ListMoviesState {}
