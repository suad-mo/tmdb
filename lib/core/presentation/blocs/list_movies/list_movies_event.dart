part of 'list_movies_bloc.dart';

abstract class ListMoviesEvent extends Equatable {
  const ListMoviesEvent();

  @override
  List<Object?> get props => [];
}

class ListMoviesLoadEvent extends ListMoviesEvent {
  final String _path;
  final Map<String, String>? _query;

  const ListMoviesLoadEvent({required String path, Map<String, String>? query})
      : _path = path,
        _query = query;

  String get path => _path;
  Map<String, String>? get query => _query;

  @override
  List<Object?> get props => [_path, _query];
}
