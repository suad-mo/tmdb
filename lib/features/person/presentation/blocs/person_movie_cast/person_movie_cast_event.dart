part of 'person_movie_cast_bloc.dart';

abstract class PersonMovieCastEvent extends Equatable {
  const PersonMovieCastEvent();

  @override
  List<Object> get props => [];
}

class GetPersonMovieCastByIdEvent extends PersonMovieCastEvent {
  final int _id;

  const GetPersonMovieCastByIdEvent({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object> get props => [id];
}

class SotrPersonMovieCastByPopularityEvent extends PersonMovieCastEvent {
  final List<MovieCastEntity> cast;

  const SotrPersonMovieCastByPopularityEvent({required this.cast});

  @override
  List<Object> get props => [cast];
}
