part of 'scroll_list_bloc.dart';

abstract class ScrollListEvent extends Equatable {
  const ScrollListEvent();

  @override
  List<Object?> get props => [];
}

class ScrollListLoadEvent extends ScrollListEvent {
  const ScrollListLoadEvent();

  @override
  List<Object?> get props => [];
}

class ScrollListLoadWithParamsEvent extends ScrollListEvent {
  const ScrollListLoadWithParamsEvent({
    required String path,
    Map<String, String>? query,
  })  : _query = query,
        _path = path;

  final String _path;
  final Map<String, String>? _query;

  String get path => _path;
  Map<String, String>? get query => _query;

  @override
  List<Object?> get props => [_path, _query];
}
