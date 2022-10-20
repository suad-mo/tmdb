part of 'list_movies_bloc.dart';

abstract class ListMoviesEvent extends Equatable {
  const ListMoviesEvent();

  @override
  List<Object?> get props => [];
}

// class ListMoviesStarted extends ListMoviesEvent {
//   const ListMoviesStarted();

//   @override
//   List<Object?> get props => [];
// }

class ListMoviesLoadEvent extends ListMoviesEvent {
  // final MoviesResponseEntity moviesResponseEntity;

  const ListMoviesLoadEvent(); //{required this.moviesResponseEntity});

  @override
  List<Object?> get props => [];
}

// class ListMoviesReloadEvent extends ListMoviesEvent {
//   final String _path;
//   final Map<String, String>? _query;

//   const ListMoviesReloadEvent(
//       {required String path, Map<String, String>? query})
//       : _path = path,
//         _query = query;

//   String get path => _path;
//   Map<String, String>? get query => _query;

//   @override
//   List<Object?> get props => [_path, _query];
// }
