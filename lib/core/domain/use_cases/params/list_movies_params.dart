import 'package:equatable/equatable.dart';
import 'package:tmdb/core/configuration/request/request_movies.dart';

class ListMoviesParams extends Equatable {
  final RequestMovies requestMovies;

  const ListMoviesParams({required this.requestMovies});

  @override
  List<Object?> get props => [requestMovies];
}
