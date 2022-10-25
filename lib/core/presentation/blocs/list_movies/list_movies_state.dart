part of 'list_movies_bloc.dart';

// ignore: must_be_immutable
abstract class ListMoviesState extends Equatable {
  const ListMoviesState();

  @override
  List<Object?> get props => [];
}

class ListMoviesInitialState extends ListMoviesState {
  const ListMoviesInitialState();

  @override
  List<Object?> get props => [];
}

class ListMoviesLoadingState extends ListMoviesState {
  final MoviesResponseEntity? moviesResponseEntity;

  const ListMoviesLoadingState({this.moviesResponseEntity});

  @override
  List<Object?> get props => [];
}

class ListMoviesLoadedState extends ListMoviesState {
  final MoviesResponseEntity moviesResponseEntity;

  const ListMoviesLoadedState({
    required this.moviesResponseEntity,
  });

  @override
  List<Object?> get props => [moviesResponseEntity];
}

class ListMoviesErrorState extends ListMoviesState {
  final MoviesResponseEntity? moviesResponseEntity;
  const ListMoviesErrorState({this.moviesResponseEntity});
}

// class ListMoviesReloadingState extends ListMoviesState {
//   const ListMoviesReloadingState({
//     required this.oldMoviesResponseEntity,
//   });
//   final MoviesResponseEntity oldMoviesResponseEntity;

//   @override
//   List<Object?> get props => [];
// }

// class ListMoviesReloadedState extends ListMoviesState {
//   final MoviesResponseEntity oldMoviesResponseEntity;
//   final MoviesResponseEntity newMoviesResponseEntity;

//   const ListMoviesReloadedState({
//     required this.oldMoviesResponseEntity,
//     required this.newMoviesResponseEntity,
//   });

//   @override
//   List<Object> get props => [oldMoviesResponseEntity, newMoviesResponseEntity];
// }

// class ListMoviesReloadErrorState extends ListMoviesState {
//   final MoviesResponseEntity oldMoviesResponseEntity;
//   const ListMoviesReloadErrorState(this.oldMoviesResponseEntity);
// }
