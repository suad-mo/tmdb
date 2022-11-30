part of 'person_tv_cast_bloc.dart';

abstract class PersonTvCastEvent extends Equatable {
  const PersonTvCastEvent();

  @override
  List<Object> get props => [];
}

class GetPersonTvCastByIdEvent extends PersonTvCastEvent {
  final int _id;

  const GetPersonTvCastByIdEvent({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object> get props => [id];
}

class SotrPersonTvCastByPopularityEvent extends PersonTvCastEvent {
  final List<TvCastEntity> cast;

  const SotrPersonTvCastByPopularityEvent({required this.cast});

  @override
  List<Object> get props => [cast];
}
