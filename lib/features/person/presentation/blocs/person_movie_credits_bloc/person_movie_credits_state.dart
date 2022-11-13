part of 'person_movie_credits_bloc.dart';

abstract class PersonMovieCreditsState extends Equatable {
  const PersonMovieCreditsState();

  @override
  List<Object?> get props => [];
}

class PersonMovieCreditsInitial extends PersonMovieCreditsState {}

class PersonMovieCreditsLoadingState extends PersonMovieCreditsState {
  const PersonMovieCreditsLoadingState();
}

class PersonMovieCreditsLoadedState extends PersonMovieCreditsState {
  final PersonMovieCreditsEntity _personMovieCreditsEntity;

  const PersonMovieCreditsLoadedState({
    required PersonMovieCreditsEntity personMovieCredits,
  }) : _personMovieCreditsEntity = personMovieCredits;

  PersonMovieCreditsEntity get personMovieCreditsEntity =>
      _personMovieCreditsEntity;

  @override
  List<Object?> get props => [personMovieCreditsEntity];
}

class PersonMovieCreditsErrorState extends PersonMovieCreditsState {
  const PersonMovieCreditsErrorState();

  @override
  List<Object?> get props => [];
}
