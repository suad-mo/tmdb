part of 'scroll_list_bloc.dart';

abstract class ScrollListEvent extends Equatable {
  const ScrollListEvent();

  @override
  List<Object?> get props => [];
}

class ScrollListLoadEvent extends ScrollListEvent {
  // final MoviesResponseEntity moviesResponseEntity;

  const ScrollListLoadEvent(); //{required this.moviesResponseEntity});

  @override
  List<Object?> get props => [];
}
