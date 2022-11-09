part of 'person_detail_bloc.dart';

abstract class PersonDetailEvent extends Equatable {
  const PersonDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPersonDetailByIdEvent extends PersonDetailEvent {
  final int _id;

  const GetPersonDetailByIdEvent({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object> get props => [id];
}
