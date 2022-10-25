part of 'scroll_list_bloc.dart';

abstract class ScrollListState extends Equatable {
  const ScrollListState();

  @override
  List<Object?> get props => [];
}

class ScrollListInitial extends ScrollListState {
  const ScrollListInitial();

  @override
  List<Object?> get props => [];
}

class ScrollListLoadingState extends ScrollListState {
  final MoviesResponseEntity? moviesResponseEntity;

  const ScrollListLoadingState({this.moviesResponseEntity});

  @override
  List<Object?> get props => [moviesResponseEntity];
}

class ScrollListLoadedState extends ScrollListState {
  final MoviesResponseEntity moviesResponseEntity;

  const ScrollListLoadedState({
    required this.moviesResponseEntity,
  });

  @override
  List<Object> get props => [moviesResponseEntity];
}

class ScrollListErrorState extends ScrollListState {
  final MoviesResponseEntity? moviesResponseEntity;

  const ScrollListErrorState({this.moviesResponseEntity});

  @override
  List<Object?> get props => [moviesResponseEntity];
}
