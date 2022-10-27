part of 'movies_response_bloc.dart';

abstract class MoviesResponseEvent extends Equatable {
  const MoviesResponseEvent();

  @override
  List<Object?> get props => [];
}

class MoviesResponseLoadEvent extends MoviesResponseEvent {
  final String path;
  final Map<String, String>? query;

  const MoviesResponseLoadEvent({
    required this.path,
    required this.query,
  });

  @override
  List<Object?> get props => [path, query];
}
