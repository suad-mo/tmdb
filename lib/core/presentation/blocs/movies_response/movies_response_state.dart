part of 'movies_response_bloc.dart';

abstract class MoviesResponseState extends Equatable {
  const MoviesResponseState();

  @override
  List<Object?> get props => [];
}

class MoviesResponseInitial extends MoviesResponseState {}

class MoviesResponseLoadingState extends MoviesResponseState {
  final MoviesResponseEntity? oldMoviesResponseEntity;

  const MoviesResponseLoadingState({
    this.oldMoviesResponseEntity,
  });

  @override
  List<Object?> get props => [oldMoviesResponseEntity];
}

class MoviesResponseLoadedState extends MoviesResponseState {
  final MoviesResponseEntity moviesResponseEntity;

  const MoviesResponseLoadedState({
    required this.moviesResponseEntity,
  });

  @override
  List<Object?> get props => [moviesResponseEntity];
}

class MoviesResponseErrorState extends MoviesResponseState {
  final MoviesResponseEntity? oldMoviesResponseEntity;

  const MoviesResponseErrorState({this.oldMoviesResponseEntity});

  @override
  List<Object?> get props => [oldMoviesResponseEntity];
}
