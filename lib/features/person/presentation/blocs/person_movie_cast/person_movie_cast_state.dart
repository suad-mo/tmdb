part of 'person_movie_cast_bloc.dart';

abstract class PersonMovieCastState extends Equatable {
  const PersonMovieCastState();

  @override
  List<Object?> get props => [];
}

class PersonMovieCastInitial extends PersonMovieCastState {}

class PersonMovieCastLoadingState extends PersonMovieCastState {
  const PersonMovieCastLoadingState();
}

class PersonMovieCastLoadedState extends PersonMovieCastState {
  final List<MovieCastEntity> _movieCast;

  const PersonMovieCastLoadedState({
    required List<MovieCastEntity> movieCast,
  }) : _movieCast = movieCast;

  List<MovieCastEntity> get movieCast => _movieCast;
  @override
  List<Object?> get props => [_movieCast];
}

class PersonMovieCastErrorState extends PersonMovieCastState {
  const PersonMovieCastErrorState();

  @override
  List<Object?> get props => [];
}
