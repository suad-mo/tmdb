part of 'person_detail_bloc.dart';

abstract class PersonDetailState extends Equatable {
  const PersonDetailState();

  @override
  List<Object?> get props => [];
}

class PersonDetailInitial extends PersonDetailState {}

class PersonDetailLoadingState extends PersonDetailState {
  const PersonDetailLoadingState();
}

class PersonDetailLoadedState extends PersonDetailState {
  final PersonDetailEntity _personDetailEntity;

  const PersonDetailLoadedState({
    required PersonDetailEntity personDetail,
  }) : _personDetailEntity = personDetail;

  PersonDetailEntity get personDetailEntity => _personDetailEntity;

  @override
  List<Object?> get props => [personDetailEntity];
}

class PersonDetailErrorState extends PersonDetailState {
  const PersonDetailErrorState();

  @override
  List<Object?> get props => [];
}
