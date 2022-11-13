part of 'person_movie_credits_bloc.dart';

abstract class PersonMovieCreditsEvent extends Equatable {
  const PersonMovieCreditsEvent();

  @override
  List<Object> get props => [];
}

class GetPersonMovieCreditsByIdEvent extends PersonMovieCreditsEvent {
  final int _id;

  const GetPersonMovieCreditsByIdEvent({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object> get props => [id];
}
