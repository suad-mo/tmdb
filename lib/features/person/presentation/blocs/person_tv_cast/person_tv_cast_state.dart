part of 'person_tv_cast_bloc.dart';

abstract class PersonTvCastState extends Equatable {
  const PersonTvCastState();

  @override
  List<Object?> get props => [];
}

class PersonTvCastInitial extends PersonTvCastState {}

class PersonTvCastLoadingState extends PersonTvCastState {
  const PersonTvCastLoadingState();
}

class PersonTvCastLoadedState extends PersonTvCastState {
  final List<TvCastEntity> _tvCast;

  const PersonTvCastLoadedState({
    required List<TvCastEntity> tvCast,
  }) : _tvCast = tvCast;

  List<TvCastEntity> get tvCast => _tvCast;
  @override
  List<Object?> get props => [_tvCast];
}

class PersonTvCastErrorState extends PersonTvCastState {
  const PersonTvCastErrorState();

  @override
  List<Object?> get props => [];
}
